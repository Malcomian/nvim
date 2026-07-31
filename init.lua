-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- home page
vim.keymap.set("n", "<leader>h", Snacks.dashboard.open, { desc = "Open LazyVim Dashboard" })

-- neovide config
if vim.g.neovide then
  -- font with full color OS-specific emoji fallback
  local emoji_font = ""
  if vim.fn.has("win32") == 1 then
    emoji_font = ", Segoe UI Emoji"
  elseif vim.fn.has("linux") == 1 then
    emoji_font = ", Noto Color Emoji"
  elseif vim.fn.has("mac") == 1 then
    emoji_font = ", Apple Color Emoji"
  end
  vim.o.guifont = "FiraCode Nerd Font Mono" .. emoji_font

  -- dynamic title bar color
  local normal_bg = string.format("#%06x", vim.api.nvim_get_hl(0, { name = "Normal" }).bg)
  vim.g.neovide_title_background_color = normal_bg
  vim.g.neovide_title_text_color = "#ffffff"
  -- far scroll animation fix
  vim.g.neovide_scroll_animation_far_lines = 0.1
  -- force continuous rendering
  vim.g.neovide_no_idle = true
  -- disable vsync
  vim.g.neovide_vsync = false
  -- opacity is handled with a plugin that offers a dialog to change it: <leader>uo

  -- Set a default initial scale factor
  vim.g.neovide_scale_factor = 1.0

  -- Create a helper function to modify the scale
  local change_scale_factor = function(delta)
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + delta
  end

  -- Map keys to zoom in, zoom out, and reset
  vim.keymap.set("n", "<C-=>", function()
    change_scale_factor(0.05)
  end, { desc = "Neovide Zoom In +0.05" })
  vim.keymap.set("n", "<C-->", function()
    change_scale_factor(-0.05)
  end, { desc = "Neovide Zoom Out -0.05" })
  vim.keymap.set("n", "<C-0>", function()
    vim.g.neovide_scale_factor = 1.0
  end, { desc = "Neovide Zoom Reset" })
end
