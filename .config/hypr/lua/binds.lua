local programs = require("lua.programs")

local main_mod = "SUPER"

-- Programs

hl.bind(main_mod .. " + Q", hl.dsp.exec_cmd(programs.terminal))
hl.bind(main_mod .. " + I", hl.dsp.exec_cmd(programs.browser))
hl.bind(main_mod .. " + O", hl.dsp.exec_cmd("obsidian"))
hl.bind(main_mod .. " + S", hl.dsp.exec_cmd(programs.screen_shot))
hl.bind(main_mod .. " + W", hl.dsp.exec_cmd(programs.wallpaper_picker))

-- Launcher

hl.bind(main_mod .. " + SPACE", hl.dsp.exec_cmd(
   'wezterm start --class "launcher" otter-launcher'
))

hl.window_rule({
   name = "launcher-float",
   match = {
      class = "^(launcher)$"
   },
   size = { 500, 600 },
   float = true,
   center = true,
   pin = true,
})

-- Window Management

hl.bind(main_mod .. " + C", hl.dsp.window.close())
hl.bind(main_mod .. " + F", hl.dsp.window.float({ action = "toggle" }))

hl.bind(main_mod .. " + SHIFT + h", hl.dsp.window.move({ direction = "l" }))
hl.bind(main_mod .. " + SHIFT + l", hl.dsp.window.move({ direction = "r" }))
hl.bind(main_mod .. " + SHIFT + k", hl.dsp.window.move({ direction = "u" }))
hl.bind(main_mod .. " + SHIFT + j", hl.dsp.window.move({ direction = "d" }))

-- Movement

hl.bind(main_mod .. " + h", hl.dsp.focus({ direction = "l" }))
hl.bind(main_mod .. " + l", hl.dsp.focus({ direction = "r" }))
hl.bind(main_mod .. " + k", hl.dsp.focus({ direction = "u" }))
hl.bind(main_mod .. " + j", hl.dsp.focus({ direction = "d" }))

-- Workspaces

for i = 1, 10 do
   local workspace = i % 10
   hl.bind(main_mod .. " + " .. workspace, hl.dsp.focus({ workspace = workspace }))
   hl.bind(main_mod .. " + SHIFT + " .. workspace, hl.dsp.window.move({ workspace = workspace }))
end

-- Drag

hl.bind(main_mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(main_mod .. " + mouse:272", hl.dsp.window.resize(), { mouse = true })

-- Audio Buttons

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })

-- Brighness Buttons

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true })
