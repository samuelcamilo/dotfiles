-- A Neovim plugin for advanced syntax highlighting and indentation using Tree-sitter.
-- Supports multiple languages, ensuring accurate parsing and improved code readability.

return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  main = 'nvim-treesitter.configs',
  opts = {
    ensure_installed = {
      'lua',
      'go',
      'bash',
      'json',
      'dockerfile',
      'yaml',
      'make',
      'terraform',
      'markdown',
      'markdown_inline',
      'vim',
      'vimdoc',
    },
    auto_install = false,
    highlight = {
      enable = true,
      -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
      --  If you are experiencing weird indenting issues, add the language to
      --  the list of additional_vim_regex_highlighting and disabled languages for indent.
      additional_vim_regex_highlighting = true,
    },
    indent = { enable = true },
  },
}
