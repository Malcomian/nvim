return {
  {
    "olrtg/nvim-emmet",
    config = function()
      vim.keymap.set({ "n", "v" }, "<leader>xe", require("nvim-emmet").wrap_with_abbreviation, {
        desc = "Emmet: Wrap with abbreviation",
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers = opts.servers or {}

      opts.servers.emmet_language_server = {
        filetypes = {
          "html",
          "css",
          "scss",
          "less",
          "javascript",
          "typescript",
          "javascriptreact",
          "typescriptreact",
          "jsx",
          "tsx",
        },

        init_options = {
          includeLanguages = {
            ["javascript"] = "html",
            ["typescript"] = "html",
            ["javascriptreact"] = "html",
            ["typescriptreact"] = "html",
          },
        },

        -- Disable automatic completions in JS/TS files
        on_attach = function(client, bufnr)
          local filetype = vim.bo[bufnr].filetype
          if filetype:match("javascript") or filetype:match("typescript") then
            client.server_capabilities.completionProvider = false
          end
        end,
      }
    end,
  },
}
