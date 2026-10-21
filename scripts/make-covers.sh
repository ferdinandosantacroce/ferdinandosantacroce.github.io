#!/usr/bin/env bash
#
# Build 1600x340 cover strips for talk bundles: a dark band tinted with a
# colour sampled from the talk image, and the image itself on the right,
# fading into the band on its left edge.
#
# Usage:
#   bash scripts/make-covers.sh                 # every talk with an image, dry list
#   bash scripts/make-covers.sh --apply         # generate and update front matter
#   bash scripts/make-covers.sh --apply <slug>  # one talk only
#   bash scripts/make-covers.sh --section post --apply
#
set -euo pipefail
cd "$(dirname "$0")/.."

WIDTH=1600
HEIGHT=340
PANEL_PERCENT=46
QUALITY=88

APPLY=0
SECTION=talks
SLUGS=()

usage() {
    sed -n '3,12p' "$0" | sed 's/^# \{0,1\}//'
    exit 0
}

while [ $# -gt 0 ]; do
    case "$1" in
        --apply) APPLY=1 ;;
        --section) SECTION="${2:?missing section}"; shift ;;
        -h|--help) usage ;;
        -*) echo "unknown option: $1" >&2; exit 2 ;;
        *) SLUGS+=("$1") ;;
    esac
    shift
done

# Two accents sampled from the image: the most saturated colours, skipping
# near-white and near-black pixels and avoiding two colours of the same hue.
sample_colours() {
    local src="$1"
    magick "$src" -auto-orient -resize 160x160! -colors 16 -unique-colors txt:- |
        sed -nE 's/.*#([0-9A-Fa-f]{6}).*/\1/p' |
        awk '
            function hue(r, g, b,   mx, mn, d, h) {
                mx = (r > g ? (r > b ? r : b) : (g > b ? g : b))
                mn = (r < g ? (r < b ? r : b) : (g < b ? g : b))
                d = mx - mn
                if (d == 0) return 0
                if (mx == r) h = 60 * ((g - b) / d)
                else if (mx == g) h = 60 * (2 + (b - r) / d)
                else h = 60 * (4 + (r - g) / d)
                if (h < 0) h += 360
                return h
            }
            {
                r = strtonum("0x" substr($0, 1, 2))
                g = strtonum("0x" substr($0, 3, 2))
                b = strtonum("0x" substr($0, 5, 2))
                mx = (r > g ? (r > b ? r : b) : (g > b ? g : b))
                mn = (r < g ? (r < b ? r : b) : (g < b ? g : b))
                sat = (mx == 0 ? 0 : (mx - mn) / mx)
                lum = (mx + mn) / 2
                if (lum < 35 || lum > 240 || sat < 0.18) next
                score = sat * (1 - (lum - 150) / 260)
                printf "%.4f %s %d\n", score, $0, hue(r, g, b)
            }' |
        sort -rn |
        awk '{
            if (n == 0) { print $2; h1 = $3; n = 1; next }
            d = $3 - h1; if (d < 0) d = -d; if (d > 180) d = 360 - d
            if (d > 25) { print $2; exit }
        }'
}

make_cover() {
    local src="$1" out="$2" work c1 panel sw sh gravity
    work=$(mktemp -d)
    trap 'rm -rf "$work"' RETURN

    mapfile -t colours < <(sample_colours "$src")
    c1="${colours[0]:-4a4a55}"
    panel=$((WIDTH * PANEL_PERCENT / 100))

    # Tall images (slides, boards, 4:3 photos) are cropped from the top so the
    # title stays visible; wider ones are cropped from the centre.
    read -r sw sh < <(identify -format '%w %h\n' "$src")
    gravity=center
    if [ $((sh * 10 / sw)) -ge 6 ]; then gravity=north; fi

    # Photo panel on the right, cropped to the band height.
    magick "$src" -auto-orient -resize "${panel}x${HEIGHT}^" -gravity "$gravity" \
        -extent "${panel}x${HEIGHT}" -modulate 92,110 "$work/photo.png"

    # Mask: transparent on the left, solid after roughly a third of the panel,
    # so the image melts into the band.
    magick -size "${panel}x${HEIGHT}" gradient:white-black -rotate 90 \
        -resize "${panel}x${HEIGHT}!" -level 0%,32% "$work/mask.png"
    magick "$work/photo.png" "$work/mask.png" -alpha off \
        -compose CopyOpacity -composite "$work/photo-fade.png"

    # Dark band with a faint tint of the sampled colour.
    magick -size "${WIDTH}x${HEIGHT}" gradient:'#101014'-'#08080a' \
        -rotate 90 -resize "${WIDTH}x${HEIGHT}!" "$work/base.png"
    magick -size "${WIDTH}x${HEIGHT}" radial-gradient:"#${c1}"-'#000000' \
        -evaluate multiply 0.45 -blur 0x90 "$work/glow.png"

    # Slight darkening at the bottom edge, so a white screenshot does not
    # melt into the white page card below.
    magick -size "${WIDTH}x60" gradient:'rgba(0,0,0,0)'-'rgba(0,0,0,0.40)' \
        "$work/bottom.png"

    magick "$work/base.png" "$work/glow.png" -compose screen -composite \
        "$work/photo-fade.png" -gravity east -composite \
        "$work/bottom.png" -gravity south -composite \
        -quality "$QUALITY" -sampling-factor 4:2:0 -interlace Plane -strip "$out"

    echo "  colour #${c1}"
}

update_front_matter() {
    local file="$1" img="$2" tmp
    grep -q '^image:[[:space:]]*cover\.jpg[[:space:]]*$' "$file" && return 0
    tmp=$(mktemp)
    awk -v img="$img" '
        /^image:[[:space:]]/ {
            print "image: cover.jpg"
            if (!seen_thumb) { print "thumb: " img; seen_thumb = 1 }
            next
        }
        /^thumb:[[:space:]]/ { next }
        { print }
    ' "$file" > "$tmp"
    mv "$tmp" "$file"
}

found=0
for dir in content/"$SECTION"/*/; do
    slug=$(basename "$dir")
    if [ ${#SLUGS[@]} -gt 0 ]; then
        match=0
        for wanted in "${SLUGS[@]}"; do
            [ "$slug" = "$wanted" ] && match=1
        done
        [ "$match" -eq 1 ] || continue
    fi

    it="$dir/index.it.md"
    [ -f "$it" ] || continue

    image=$(awk -F': *' '/^image:/{print $2; exit}' "$it")
    [ -n "$image" ] || continue

    if [ "$image" = "cover.jpg" ]; then
        image=$(awk -F': *' '/^thumb:/{print $2; exit}' "$it")
        [ -n "$image" ] || { echo "skip $slug: cover without thumb" >&2; continue; }
    fi
    [ -f "$dir/$image" ] || { echo "warn $slug: missing $image" >&2; continue; }

    found=$((found + 1))
    echo "$slug ($image)"
    if [ "$APPLY" -eq 1 ]; then
        make_cover "$dir/$image" "$dir/cover.jpg"
        update_front_matter "$it" "$image"
        [ -f "$dir/index.en.md" ] && update_front_matter "$dir/index.en.md" "$image"
    fi
done

if [ "$found" -eq 0 ]; then
    echo "nothing to do" >&2
elif [ "$APPLY" -eq 0 ]; then
    echo
    echo "$found cover(s) ready to build. Re-run with --apply to write them."
fi
