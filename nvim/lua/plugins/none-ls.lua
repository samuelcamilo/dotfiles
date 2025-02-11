-- none-ls.nvim - A Neovim plugin that extends the built-in LSP with
-- diagnostics, code actions, and formatting from external sources.
-- Acts as a bridge for non-LSP tools like linters and formatters.

return {
  "nvimtools/none-ls.nvim",
  optional = true,
  dependencies = {
    {
      "williamboman/mason.nvim",
      opts = { ensure_installed = { "gomodifytags", "impl" } },
    },
  },
  opts = function(_, opts)
    local nls = require("null-ls")
    opts.sources = vim.list_extend(opts.sources or {}, {
      nls.builtins.diagnostics.hadolint,
      nls.builtins.code_actions.gomodifytags,
      nls.builtins.code_actions.impl,
      nls.builtins.formatting.goimports,
      nls.builtins.formatting.gofumpt,
    })
  end,
}
