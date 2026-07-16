return {
  {
    "LunarVim/bigfile.nvim",
    opts = {
      filesize = 2, -- Size in MiB (default is 1.5)
      pattern = { "*" }, -- Match all files
      features = {
        "indent_blankline",
        "illuminate",
        "lsp",
        "treesitter",
        "syntax",
        "matchparen",
        "vimopts",
        "filetype",
      },
    },
  },
}
