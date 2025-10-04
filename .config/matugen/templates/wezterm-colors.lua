local function colors(config)
   config.colors = {
      foreground = "{{colors.on_surface.default.hex}}",
      background = "{{colors.on_primary_container.default.hex | set_lightness: -20.0}}",
   }
end

return colors
