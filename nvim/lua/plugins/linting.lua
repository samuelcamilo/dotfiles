-- nvim-lint - A lightweight and asynchronous linting engine for Neovim.
-- Supports multiple linters per file type, runs independently of LSP,
-- and provides on-the-fly diagnostics without blocking the editor.

return {
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        dockerfile = { "hadolint" },
      },
    },
  },
}
