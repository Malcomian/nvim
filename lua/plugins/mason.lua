return {
  "mason-org/mason.nvim",
  opts = function(_, opts)
    -- ensure Mason installations https://mason-registry.dev/registry/list
    vim.list_extend(opts.ensure_installed, {
      -- language servers
      "vtsls",
      "html-lsp",
      "css-lsp",
      "json-lsp",
      "emmet-language-server",
      "lua-language-server",
      "yaml-language-server",
      "marksman",
      "taplo", -- TOML toolkit
      "pyright", -- python
      -- formatters
      "markdown-toc", -- markdown table of contents
      "prettier",
      "ruff", -- python
      "shfmt",
      "stylua", -- lua formatter and LSP
      -- linters
      "shellcheck", -- shell script linter for bash
      -- debuggers
      "js-debug-adapter",
    })
  end,
}
