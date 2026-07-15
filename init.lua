-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- neovide config
if vim.g.neovide then
  vim.o.guifont = "CaskaydiaMono Nerd Font Mono"
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
end
