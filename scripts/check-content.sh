#!/usr/bin/env bash
#
# Content guardrails for the bilingual Hugo site.
#
# Static checks (always):
#   - every bundle has an English and an Italian file
#   - required front matter fields per section
#   - images referenced by a bundle exist in the bundle
#   - slugs are unique within a language
#   - series parts are consecutive, starting at 1
#   - bundles with one side in draft become the translation debt report
#
# Site checks (only with --site <dir>, after a build):
#   - every relative and absolute image path resolves in the built site
#   - every internal link resolves in the built site
#
# Usage: scripts/check-content.sh [--site public]

set -uo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT" || exit 2

SITE=""
while [ $# -gt 0 ]; do
    case "$1" in
        --site)
            [ $# -ge 2 ] || { echo "Missing value for --site" >&2; exit 2; }
            SITE="$2"
            shift 2
            ;;
        -h|--help)
            sed -n '3,22p' "$0" | sed 's/^# \{0,1\}//'
            exit 0
            ;;
        *)
            echo "Unknown option: $1" >&2
            exit 2
            ;;
    esac
done

if [ -n "$SITE" ] && [ ! -d "$SITE" ]; then
    echo "Site directory not found: $SITE" >&2
    exit 2
fi

errors=0
warnings=0
err() { printf 'ERROR  %s\n' "$*"; errors=$((errors + 1)); }
warn() { printf 'WARN   %s\n' "$*"; warnings=$((warnings + 1)); }

front_matter() {
    awk 'NR==1 && $0=="---" { inside=1; next } inside && $0=="---" { exit } inside { print }' "$1"
}

has_field() {
    front_matter "$1" | grep -qE "^$2:[[:space:]]*[^[:space:]]"
}

# Same as has_field but rejects empty values, including empty quotes.
has_value() {
    front_matter "$1" | grep -qE "^$2:[[:space:]]*[\"']?[^[:space:]\"']"
}

is_draft() {
    front_matter "$1" | grep -qiE '^draft:[[:space:]]*true[[:space:]]*$'
}

field_value() {
    front_matter "$1" | sed -nE "s/^$2:[[:space:]]*//p" | head -n 1 | sed -E 's/^"(.*)"$/\1/'
}

# Bundles: directories that contain a language index file.
bundles="$(
    find content -type f \( -name 'index.md' -o -name 'index.en.md' -o -name 'index.it.md' \) \
        -printf '%h\n' | sort -u
)"

debt_missing=""
debt_draft=""

for bundle in $bundles; do
    en=""
    it=""
    [ -f "$bundle/index.en.md" ] && en="$bundle/index.en.md"
    [ -f "$bundle/index.md" ] && en="$bundle/index.md"
    [ -f "$bundle/index.it.md" ] && it="$bundle/index.it.md"

    if [ -f "$bundle/index.md" ] && [ -f "$bundle/index.en.md" ]; then
        err "$bundle has both index.md and index.en.md"
    fi

    section="$(printf '%s' "$bundle" | cut -d/ -f2)"

    case "$section" in
        post) required="title date description slug" ;;
        talks) required="title date description" ;;
        works) required="title description group" ;;
        page) required="title" ;;
        *) required="title" ;;
    esac

    for file in "$en" "$it"; do
        [ -n "$file" ] || continue
        for key in $required; do
            case "$key" in
                title|description|slug)
                    has_value "$file" "$key" || err "$file has an empty or missing front matter field '$key'"
                    ;;
                *)
                    has_field "$file" "$key" || err "$file is missing front matter field '$key'"
                    ;;
            esac
        done
    done

    # Bilingual parity. A missing side is a structural error, a draft side is debt.
    if [ -z "$en" ]; then
        err "$bundle has no English file"
        debt_missing="$debt_missing\n| \`$bundle\` | English |"
    fi
    if [ -z "$it" ]; then
        err "$bundle has no Italian file"
        debt_missing="$debt_missing\n| \`$bundle\` | Italian |"
    fi

    if [ -n "$en" ] && is_draft "$en"; then
        debt_draft="$debt_draft\n| \`$bundle\` | English |"
    fi
    if [ -n "$it" ] && is_draft "$it"; then
        debt_draft="$debt_draft\n| \`$bundle\` | Italian |"
    fi

    # Images referenced from the bundle, both markdown and inline HTML.
    while IFS= read -r ref; do
        [ -n "$ref" ] || continue
        path="$ref"
        path="${path%% *}"      # drop an optional markdown title
        path="${path%%\?*}"     # drop a query string
        case "$path" in
            http://*|https://*|data:*|//*) continue ;;
            /*)
                if [ -n "$SITE" ] && [ ! -f "$SITE$path" ]; then
                    err "$bundle references a missing image: $path"
                fi
                ;;
            *)
                [ -f "$bundle/$path" ] || err "$bundle references a missing image: $path"
                ;;
        esac
    done <<EOF
$(grep -hoE '!\[[^]]*\]\([^)]*\)' "$bundle"/*.md 2>/dev/null | sed -E 's/^.*\]\(([^)]*)\)$/\1/')
$(grep -hoE '<img[^>]*src="[^"]*"' "$bundle"/*.md 2>/dev/null | sed -E 's/^.*src="([^"]*)".*$/\1/')
EOF

    # Internal links, checked against the built site when asked.
    if [ -n "$SITE" ]; then
        while IFS= read -r link; do
            [ -n "$link" ] || continue
            path="${link#https://ferdinandosantacroce.it}"
            path="${path%%#*}"
            path="${path%%\?*}"
            [ -n "$path" ] || continue
            case "$path" in
                http://*|https://*|mailto:*|tel:*|//*) continue ;;
                /*) ;;
                *) continue ;;
            esac
            target="$SITE$path"
            if [ -f "$target" ] || [ -f "$target/index.html" ]; then
                continue
            fi
            err "$bundle has a broken internal link: $link"
        done <<EOF
$(grep -hoE '\]\((https://ferdinandosantacroce\.it)?/[^)]*\)' "$bundle"/*.md 2>/dev/null | sed -E 's/^.*\]\(([^)]*)\)$/\1/')
EOF
    fi
done

# Duplicate slugs within the same language.
slug_report="$(
    for lang in en it; do
        find content -type f \( -name 'index.md' -o -name 'index.en.md' -o -name 'index.it.md' \) -print0 2>/dev/null |
            while IFS= read -r -d '' file; do
                case "$file" in
                    *.it.md) file_lang=it ;;
                    *) file_lang=en ;;
                esac
                [ "$file_lang" = "$lang" ] || continue
                value="$(field_value "$file" slug)"
                if [ -n "$value" ]; then
                    printf '%s\t%s\n' "$value" "$file"
                fi
            done | sort | awk -F'\t' '
                $1 == prev { printf "ERROR  duplicate slug %s: %s and %s\n", $1, prevfile, $2; found=1 }
                { prev=$1; prevfile=$2 }
                END { exit found ? 1 : 0 }
            '
    done
)"
if [ -n "$slug_report" ]; then
    printf '%s\n' "$slug_report"
    errors=$((errors + $(printf '%s\n' "$slug_report" | grep -c '^ERROR')))
fi

# Series continuity: parts must be 1..N without gaps.
series_report="$(
    find content -type f -name 'index.*.md' -print0 2>/dev/null |
        while IFS= read -r -d '' file; do
            series="$(field_value "$file" series)"
            part="$(field_value "$file" part)"
            if [ -n "$series" ] && [ -n "$part" ]; then
                printf '%s\t%s\n' "$series" "$part"
            fi
        done | sort -u | awk -F'\t' '
            $1 == current { count++; seen[$2]=1; next }
            {
                if (current != "") {
                    for (i = 1; i <= count; i++) if (!(i in seen)) {
                        printf "ERROR  series %s: missing part %d\n", current, i
                        failed=1
                    }
                }
                current=$1; count=1; delete seen; seen[$2]=1
            }
            END {
                if (current != "") {
                    for (i = 1; i <= count; i++) if (!(i in seen)) {
                        printf "ERROR  series %s: missing part %d\n", current, i
                        failed=1
                    }
                }
                exit failed ? 1 : 0
            }
        '
)"
if [ -n "$series_report" ]; then
    printf '%s\n' "$series_report"
    errors=$((errors + $(printf '%s\n' "$series_report" | grep -c '^ERROR')))
fi

# Translation debt report.
report="docs/contenuti/debito-traduzioni.md"
mkdir -p "$(dirname "$report")"
{
    echo "# Debito traduzioni"
    echo
    echo "Generato da \`scripts/check-content.sh\`. Non modificare a mano: si rigenera a ogni esecuzione."
    echo
    echo "## Coppie incomplete"
    echo
    if [ -z "$debt_missing" ]; then
        echo "Nessuna: ogni bundle ha entrambe le lingue."
    else
        echo "| Bundle | Lingua mancante |"
        echo "| --- | --- |"
        printf '%b\n' "$debt_missing"
    fi
    echo
    echo "## Un lato in bozza"
    echo
    if [ -z "$debt_draft" ]; then
        echo "Nessuno: nessun bundle ha un lato in \`draft: true\`."
    else
        echo "| Bundle | Lingua in bozza |"
        echo "| --- | --- |"
        printf '%b\n' "$debt_draft"
    fi
} > "$report"

echo
printf 'Content check: %d error(s), %d warning(s). Report: %s\n' "$errors" "$warnings" "$report"

[ "$errors" -eq 0 ] || exit 1
