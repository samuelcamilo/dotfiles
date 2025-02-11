-- bufferline.nvim - A Neovim plugin that provides a minimal and elegant tab-like buffer line
-- with support for clickable buffers, diagnostics, and customizable styling.
-- It enhances buffer navigation and management, making it easier to switch between open files.

return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  enable = false,
  keys = {
    { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
    { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
  },
  opts = {
    options = {
      mode = "tabs",
      show_buffer_close_icons = true,
      show_close_icon = true,
    },
  },
}
