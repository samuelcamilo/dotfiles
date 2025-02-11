-- neotest - A framework for running and managing tests in Neovim.
-- Provides a modular and extensible interface for executing tests,
-- displaying results, and integrating with multiple test runners.

return {
  "nvim-neotest/neotest",
  optional = true,
  dependencies = {
    "fredrikaverpil/neotest-golang",
  },
  opts = {
    adapters = {
      ["neotest-golang"] = {
        -- Here we can set options for neotest-golang, e.g.
        -- go_test_args = { "-v", "-race", "-count=1", "-timeout=60s" },
        dap_go_enabled = true, -- requires leoluz/nvim-dap-go
      },
    },
  },
}
