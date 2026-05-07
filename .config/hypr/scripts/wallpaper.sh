#!/usr/bin/env bash

files=(~/.dotfiles/wallpapers/*)

declare -A wallpapers

for file in "${files[@]}"; do
   wallpapers[$(basename "$file")]="$file"
done

options=$(printf "%s\n" "${!wallpapers[@]}")

selected=$(echo -e "$options" | rofi -dmenu -p "Pick a wallpaper...")
pick=${wallpapers["$selected"]}
matugen image "$pick"
