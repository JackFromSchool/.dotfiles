#!/usr/bin/env bash

options="region\nwindow\nscreen"

selected=$(echo -e "$options" | rofi -dmenu -p "What would you like to screenshot?")

case "$selected" in
   "region")
      hyprshot -m region -o ~/Screenshots
      ;;
   "window")
      hyprshot -m window -o ~/Screenshots
      ;;
   "screen")
      hyprshot -m output -o ~/Screenshots
      ;;
esac
