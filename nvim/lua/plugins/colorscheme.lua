-- You can easily change to a different colorscheme.
-- Change the name of the colorscheme plugin below, and then
-- change the command in the config to whatever the name of that colorscheme is.
--
-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.

return { 
    'catppuccin/nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
        ---@diagnostic disable-next-line: missing-fields
        require('catppuccin').setup {}

        -- Load the colorscheme here.
        -- Like many other themes, this one has different styles, and you could load
        -- any other, such as 'catppuccin-latte', 'catppuccin-frappe', 'catppuccin-macchiato' or 'catppuccin-mocha'.
        vim.cmd.colorscheme 'catppuccin-mocha'
    end,
}