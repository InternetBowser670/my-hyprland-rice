#!/bin/bash

DIR="$HOME/Pictures/wallpaper"
MONITOR="HDMI-A-2"
DEFAULT_WALLPAPER="$DIR/liquid2.jpg"

# Kill any running hyprpaper quietly
pkill hyprpaper 2>/dev/null

# Set default wallpaper immediately to avoid blank screen
hyprpaper -c <(echo -e "wallpaper = $MONITOR,$DEFAULT_WALLPAPER") &

sleep 2  # Give hyprpaper a moment to show the default wallpaper

# Create a temporary config file for hyprpaper preload settings
CONFIG_FILE=$(mktemp)

# Loop over images and add preload lines, skipping invalid PNGs
for img in "$DIR"/*.{jpg,jpeg,png}; do
    [ -f "$img" ] || continue
    if [[ "$img" == *.png ]]; then
        # Check if file is really a PNG
        if ! file "$img" | grep -q "PNG image data"; then
            echo "Skipping invalid PNG: $img"
            continue
        fi
    fi
    echo "preload = $img" >> "$CONFIG_FILE"
done

# Pick a random first image to avoid errors on start
FIRST_IMG=$(find "$DIR" -type f \( -iname '*.jpg' -o -iname '*.png' \) | shuf -n 1)
echo "wallpaper = $MONITOR,$FIRST_IMG" >> "$CONFIG_FILE"

# Start hyprpaper with the generated config file
hyprpaper -c "$CONFIG_FILE" &

# Keep track of last wallpaper to avoid repeats
LAST_FILE="$FIRST_IMG"

# Infinite shuffle loop
while true; do
    FILE=$(find "$DIR" -type f \( -iname '*.jpg' -o -iname '*.png' \) | shuf -n 1)

    # Skip if same as last wallpaper
    if [[ "$FILE" == "$LAST_FILE" ]]; then
        continue
    fi

    # For PNG files, double-check validity before applying
    if [[ "$FILE" == *.png ]]; then
        if ! file "$FILE" | grep -q "PNG image data"; then
            echo "Skipping invalid PNG: $FILE"
            continue
        fi
    fi

    # Set the wallpaper on your monitor
    hyprctl hyprpaper wallpaper "$MONITOR,$FILE"
    wallust run "$FILE"
    matugen image "$FILE" --show-colors

    LAST_FILE="$FILE"
    sleep 600  # Change wallpaper every 10 minutes
done

