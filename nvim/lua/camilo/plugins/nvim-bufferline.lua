-- Overall, akinsho/bufferline.nvim improves the buffer management and navigation experience in Neovim by providing a customizable 
-- and visually appealing tabline interface with features such as buffer grouping, sorting, and integration 
-- with the Language Server Protocol (LSP).

return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
    opts = {
      options = {
        mode = "tabs",
        separator_style = "slant",
      },
    },
}
