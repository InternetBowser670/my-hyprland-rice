#!/bin/bash

DIR="$HOME/Pictures/wallpaper"
MONITOR="HDMI-A-2"
LAST_WALLPAPER_FILE="$HOME/.cache/last_hyprpaper_wallpaper"

# Read last wallpaper file if it exists
if [[ -f "$LAST_WALLPAPER_FILE" ]]; then
    LAST_FILE=$(cat "$LAST_WALLPAPER_FILE")
else
    LAST_FILE=""
fi

# Get a list of valid image files (skip corrupted PNGs)
mapfile -t FILES < <(find "$DIR" -type f \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' \) | while read -r file; do
    if [[ "$file" == *.png ]]; then
        if file "$file" | grep -q "PNG image data"; then
            echo "$file"
        fi
    else
        echo "$file"
    fi
done)

# Pick a random wallpaper different from last
while true; do
    FILE="${FILES[RANDOM % ${#FILES[@]}]}"
    [[ "$FILE" != "$LAST_FILE" ]] && break
done

# Set the wallpaper
hyprctl hyprpaper wallpaper "$MONITOR,$FILE"
matugen image "$FILE" --show-colors

# Save the chosen wallpaper path for next time
echo "$FILE" > "$LAST_WALLPAPER_FILE"

