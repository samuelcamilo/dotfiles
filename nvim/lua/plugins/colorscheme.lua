-- A Neovim colorscheme offering a soothing, pastel aesthetic with multiple flavors (latte, frappe, macchiato, mocha).
-- Enhances code readability with customizable, visually appealing themes for a pleasant editing experience.

return {
  'catppuccin/nvim',
  -- Make sure to load this before all the other start plugins.
  priority = 1000,
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require('catppuccin').setup {}

    -- Load the colorscheme here.
    -- Like many other themes, this one has different styles, and you could load
    -- any other, such as 'catppuccin-latte', 'catppuccin-frappe', 'catppuccin-macchiato' or 'catppuccin-mocha'.
    vim.cmd.colorscheme 'catppuccin-mocha'
  end,
}
