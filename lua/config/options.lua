-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- ensure lazyvim is allowed to format even without a local config
vim.g.lazyvim_prettier_needs_config = false
-- disable autoformat by default
vim.g.autoformat = false
-- disable relative numbers by default
vim.opt.relativenumber = false
