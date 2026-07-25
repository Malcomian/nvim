return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        html = { "prettier" }, -- this makes Prettier the primary formatter
      },
      formatters = {
        prettier = {
          prepend_args = { "--print-width", "10000" },
        },
      },
    },
  },
}
