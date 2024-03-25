-- The folke/which-key.nvim package is an extension for Neovim, a highly configurable 
-- and extensible text editor. The main purpose of which-key.nvim is to provide a convenient and 
-- interactive way to explore and remember keyboard shortcuts and commands available 
-- in your Neovim environment.

return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
}
