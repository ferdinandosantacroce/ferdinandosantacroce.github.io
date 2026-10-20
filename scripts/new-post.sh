#!/usr/bin/env bash
# Create a bilingual post bundle with the front matter this site expects.
# Usage: bash scripts/new-post.sh <slug> [--en-slug <slug>] [--series <name>] [--part <n>]

set -euo pipefail

usage() {
    cat <<'EOF'
Usage: bash scripts/new-post.sh <slug> [options]

  <slug>              Italian slug, lowercase letters, digits and dashes
  --en-slug <slug>    English slug when it differs (default: same as Italian)
  --series <name>     Series name, identical in every part and language
  --part <n>          Part number, required with --series

Creates content/post/<slug>/index.it.md and index.en.md, both as drafts.
Images go in the same folder, named fig01.jpg, fig02.png, ...
EOF
    exit 1
}

die() { echo "error: $*" >&2; exit 1; }

slug=""
en_slug=""
series=""
part=""

while [[ $# -gt 0 ]]; do
    case "$1" in
        --en-slug) [[ $# -ge 2 ]] || usage; en_slug="$2"; shift 2 ;;
        --series)  [[ $# -ge 2 ]] || usage; series="$2"; shift 2 ;;
        --part)    [[ $# -ge 2 ]] || usage; part="$2"; shift 2 ;;
        -h|--help) usage ;;
        -*) die "unknown option: $1" ;;
        *) [[ -z "$slug" ]] || die "only one slug is allowed"; slug="$1"; shift ;;
    esac
done

[[ -n "$slug" ]] || usage
[[ "$slug" =~ ^[a-z0-9]+(-[a-z0-9]+)*$ ]] || die "slug must be lowercase letters, digits and dashes: $slug"
en_slug="${en_slug:-$slug}"
[[ "$en_slug" =~ ^[a-z0-9]+(-[a-z0-9]+)*$ ]] || die "English slug is not valid: $en_slug"

if [[ -n "$series" ]]; then
    [[ "$part" =~ ^[0-9]+$ ]] || die "--series requires --part with a number"
elif [[ -n "$part" ]]; then
    die "--part requires --series"
fi

dir="content/post/$slug"
[[ ! -e "$dir" ]] || die "folder already exists: $dir"

# Title from the slug: first letter uppercase, dashes to spaces.
title="${slug//-/ }"
title="$(printf '%s' "${title:0:1}" | tr '[:lower:]' '[:upper:]')${title:1}"
date="$(date +%Y-%m-%d)"

mkdir -p "$dir"

write_file() {
    local lang="$1" file="$2" file_slug="$3" file_title="$4"
    {
        echo "---"
        echo "title: \"$file_title\""
        echo "description: \"\""
        echo "slug: \"$file_slug\""
        echo "date: $date"
        if [[ -n "$series" ]]; then
            echo "series: \"$series\""
            echo "part: $part"
        fi
        echo "categories: []"
        echo "tags: []"
        echo "draft: true"
        echo "---"
        echo
    } > "$dir/$file"
}

write_file it index.it.md "$slug" "$title"
write_file en index.en.md "$en_slug" "$title"

cat <<EOF
Created $dir
  index.it.md  slug: $slug
  index.en.md  slug: $en_slug

Both are drafts. Next:
  1. fill in the titles and the descriptions (they cannot be empty)
  2. write the Italian first, then translate into English
  3. put images in the folder as fig01.jpg, fig02.png, ...
  4. run: hugo --minify --gc --cleanDestinationDir && bash scripts/check-content.sh --site public
EOF
