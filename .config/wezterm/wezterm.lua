local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.enable_wayland = false

config.enable_tab_bar = false
-- config.window_padding = {
--    left = '0cell',
--    right = '0cell',
--    top = '0.5cell',
--    bottom = '0.5cell',
-- }
config.window_background_opacity = 0.0

return config
