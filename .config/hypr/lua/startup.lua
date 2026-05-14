local programs = require("lua.programs")

hl.on("hyprland.start", function()
   for _, program in ipairs(programs.run_on_start) do
      hl.exec_cmd(program)
   end
end)
