-- conform.nvim - A lightweight and flexible autoformatter for Neovim.
-- Provides async formatting with support for multiple formatters per file type,
-- easy configuration, and integration with LSP and external formatters.

return {
  "stevearc/conform.nvim",
  optional = true,
  opts = {
    formatters_by_ft = {
      go = { "goimports", "gofumpt" },
    },
  },
}
