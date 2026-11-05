#!/bin/bash
set -euo pipefail

WALLPAPERS_DIR="$HOME/wallpapers"
THEME_ROOT="$HOME/.config/theme-switcher/themes"

if [ ! -d "$WALLPAPERS_DIR" ]; then
    echo "Wallpaper backup directory not found: $WALLPAPERS_DIR" >&2
    exit 1
fi

for theme_dir in "$WALLPAPERS_DIR"/*; do
    [ -d "$theme_dir" ] || continue

    theme_name=$(basename "$theme_dir")
    target_dir="$THEME_ROOT/$theme_name/wallpapers"

    mkdir -p "$target_dir"
    find "$target_dir" -mindepth 1 -maxdepth 1 -exec rm -rf {} +
    cp -a "$theme_dir"/. "$target_dir"/
done
