local M = {}

M.terminal = "wezterm"
M.browser = "zen-browser"
M.launcher = "rofi -show drun"
M.screen_shot = "~/.config/hypr/scripts/screenshot.sh"
M.wallpaper_picker = "~/.config/hypr/scripts/wallpaper.sh"

M.run_on_start = {
   "qs",
   "hypridle",
   "hyprsunset",
   "awww-daemon -f xrgb & /usr/bin/bash /home/jack/.config/swww/swww.sh",
   "spotfiy_player -d",
}

return M
