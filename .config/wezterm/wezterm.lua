local os = require("os")
local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- Style
config.enable_wayland = false
config.enable_tab_bar = false
config.window_background_opacity = 0.0

-- Shell
config.default_prog = { "/sbin/fish", "-l" }

return config
