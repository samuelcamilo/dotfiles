-- A Neovim plugin integrating LazyGit, providing a powerful Git interface within the editor.
-- Offers commands for Git operations, customizable floating windows, and keybindings
-- for efficient version control management.

return {
    'kdheepak/lazygit.nvim',
    cmd = {
        'LazyGit',
        'LazyGitConfig',
        'LazyGitCurrentFile',
        'LazyGitFilter',
        'LazyGitFilterCurrentFile',
    },
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
        { '<leader>lg', '<cmd>LazyGit<cr><cmd>hi LazyGitFloat guibg=NONE guifg=NONE<cr><cmd>setlocal winhl=NormalFloat:LazyGitFloat<cr>', desc = 'LazyGit' },
    },
    config = function()
        -- transparency of floating window (0-100)
        vim.g.lazygit_floating_window_winblend = 0

        -- scaling factor for floating window
        vim.g.lazygit_floating_window_scaling_factor = 0.9

        -- customize lazygit popup window border characters
        vim.g.lazygit_floating_window_border_chars = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' }

        -- use plenary.nvim to manage floating window if available
        vim.g.lazygit_floating_window_use_plenary = 0

        -- fallback to 0 if neovim-remote is not installed
        vim.g.lazygit_use_neovim_remote = 1

        -- config file path is evaluated if this value is 1
        vim.g.lazygit_use_custom_config_file_path = 0

        -- table of custom config file paths
        vim.g.lazygit_config_file_path = {}
    end,
}
