require 'core.options'  -- Load general options
require 'core.keymaps'  -- Load general keymaps
require 'core.autocmds' -- Load autocmds

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  require 'plugins.colorscheme',
  require 'plugins.telescope',
  require 'plugins.neo-tree',
  require 'plugins.treesitter',
  require 'plugins.gitsigns',
  --require 'plugins.lsp',
  --require 'plugins.autocompletion',
  --require 'plugins.none-ls',
  require 'plugins.lualine',
  --require 'plugins.bufferline',
  --require 'plugins.alpha',
  --require 'plugins.indent-blankline',
  --require 'plugins.lazygit',
  --require 'plugins.comment',
  --require 'plugins.debug',
  --require 'plugins.database',
  --require 'plugins.misc',
  --require 'plugins.harpoon',
  --require 'plugins.avante',
  --require 'plugins.chatgpt',
  --require 'plugins.aerial',
  --require 'plugins.vim-tmux-navigator',
}, {
  ui = {
    -- If you have a Nerd Font, set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- Function to check if a file exists
local function file_exists(file)
  local f = io.open(file, 'r')
  if f then
    f:close()
    return true
  else
    return false
  end
end
