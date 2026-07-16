-- lua/plugins/neovide-opacity.lua
return {
  "LazyVim/LazyVim",
  init = function()
    -- Restore last-used opacity settings on startup (before Neovide needs them)
    if vim.g.neovide then
      local path = vim.fn.stdpath("data") .. "/neovide_opacity.txt"
      local f = io.open(path, "r")
      if f then
        local line1 = f:read("*l")
        local line2 = f:read("*l")
        f:close()

        local opacity = tonumber(line1)
        local normal_opacity = tonumber(line2)

        if opacity and opacity >= 0 and opacity <= 1 then
          vim.g.neovide_opacity = opacity
        end
        if normal_opacity and normal_opacity >= 0 and normal_opacity <= 1 then
          vim.g.neovide_normal_opacity = normal_opacity
        end
      end
    end
  end,
  keys = {
    {
      "<leader>uo",
      function()
        if not vim.g.neovide then
          vim.notify("Not running in Neovide", vim.log.levels.WARN)
          return
        end

        local function save_state()
          local path = vim.fn.stdpath("data") .. "/neovide_opacity.txt"
          local f = io.open(path, "w")
          if f then
            f:write(tostring(vim.g.neovide_opacity or 1.0) .. "\n")
            f:write(tostring(vim.g.neovide_normal_opacity or 1.0) .. "\n")
            f:close()
          end
        end

        local function prompt_normal_opacity()
          local current = vim.g.neovide_normal_opacity or 1.0

          vim.ui.input({
            prompt = "Neovide normal opacity / editor bg (0.0 - 1.0): ",
            default = tostring(current),
          }, function(input)
            if not input then
              return -- cancelled
            end

            local value = tonumber(input)
            if not value or value < 0 or value > 1 then
              vim.notify("Invalid opacity: enter a number between 0.0 and 1.0", vim.log.levels.ERROR)
              return
            end

            vim.g.neovide_normal_opacity = value
            vim.cmd("redraw!")
            save_state()
            vim.notify(("Neovide normal opacity set to %.2f"):format(value))
          end)
        end

        local current = vim.g.neovide_opacity or 1.0

        vim.ui.input({
          prompt = "Neovide opacity / window (0.0 - 1.0): ",
          default = tostring(current),
        }, function(input)
          if not input then
            return -- cancelled
          end

          local value = tonumber(input)
          if not value or value < 0 or value > 1 then
            vim.notify("Invalid opacity: enter a number between 0.0 and 1.0", vim.log.levels.ERROR)
            return
          end

          vim.g.neovide_opacity = value
          vim.cmd("redraw!")
          save_state()
          vim.notify(("Neovide opacity set to %.2f"):format(value))

          -- Chain into the second prompt right after
          prompt_normal_opacity()
        end)
      end,
      desc = "Set Neovide Opacity",
    },
  },
}
