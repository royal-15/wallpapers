#!/bin/bash

set -e

for theme_dir in ~/.config/theme-switcher/themes/*; do
    theme=$(basename "$theme_dir")
    if [ -d "$theme_dir/wallpapers" ]; then
        mkdir -p ~/wallpapers/"$theme"
        cp -r "$theme_dir/wallpapers/"* ~/wallpapers/"$theme"/
    fi
done