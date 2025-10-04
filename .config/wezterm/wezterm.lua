local wezterm = require("wezterm")

local config = wezterm.config_builder()

require("colors")(config)

-- Style
config.enable_wayland = false
config.enable_tab_bar = false
config.window_background_opacity = 0.025

config.warn_about_missing_glyphs = false

return config
