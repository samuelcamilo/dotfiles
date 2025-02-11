-- nvim-dap - A powerful and extensible Debug Adapter Protocol (DAP) client for Neovim.
-- Enables debugging support for multiple languages, with breakpoints, step execution,
-- variable inspection, and custom adapter integrations.

return {
  "mfussenegger/nvim-dap",
  optional = true,
  dependencies = {
    {
      "williamboman/mason.nvim",
      opts = { ensure_installed = { "delve" } },
    },
    {
      "leoluz/nvim-dap-go",
      opts = {},
    },
  },
}
