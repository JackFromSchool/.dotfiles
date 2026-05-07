local wezterm = require("wezterm")

local config = wezterm.config_builder()

require("colors")(config)

-- Style
config.enable_wayland = false
config.enable_tab_bar = false
config.window_background_opacity = 0.5

config.warn_about_missing_glyphs = false

config.font = wezterm.font("Jetbrains Mono Nerd Font")
config.font_size = 11


config.adjust_window_size_when_changing_font_size = false


return config
