-- A Neovim plugin for Git integration, displaying signs for added, changed, and deleted lines in the gutter.
-- Enhances version control workflow with visual diff indicators and customizable symbols.

return {
  'lewis6991/gitsigns.nvim',
  opts = {
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
    signs_staged = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
  },
  config = function()
    require('gitsigns').setup()

    vim.keymap.set('n', '<leader>gp', ':Gitsigns preview_hunk<CR>', {})
    vim.keymap.set('n', '<leader>gt', ':Gitsigns toggle_current_line_blame<CR>', {})
  end,
}
