local function colors(config)
   config.colors = {
      foreground = "{{colors.on_surface.default.hex}}",
      background = "{{colors.surface_dim.default.hex}}",
   }
end

return colors
