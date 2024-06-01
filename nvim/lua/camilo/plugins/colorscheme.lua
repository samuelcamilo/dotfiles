return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    on_colors = function(colors)
      colors.comment = "#CC0000"
    end,
    config = function()
      vim.cmd([[colorscheme tokyonight-night]])
      vim.cmd([[highlight Comment guifg=#787C91]])
    end,
  },
}