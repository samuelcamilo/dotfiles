-- A file explorer plugin for Neovim, offering a tree-style view of files, buffers, and Git status.
-- Supports customizable layouts, diagnostics, and keybindings for efficient navigation and file management.

return {
  'nvim-neo-tree/neo-tree.nvim',
  event = 'VeryLazy',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
    {
      's1n7ax/nvim-window-picker',
      version = '2.*',
      config = function()
        require('window-picker').setup {
          filter_rules = {
            include_current_win = false,
            autoselect_one = true,
            bo = {
              -- if the file type is one of following, the window will be ignored
              filetype = { 'neo-tree', 'neo-tree-popup', 'notify' },
              -- if the buffer type is one of following, the window will be ignored
              buftype = { 'terminal', 'quickfix' },
            },
          },
        }
      end,
      keys = {
        { '<leader>w', ':Neotree toggle float<CR>', silent = true, desc = 'Float File Explorer' },
        { '<leader>e', ':Neotree toggle position=left<CR>', silent = true, desc = 'Left File Explorer' },
        { '<leader>ngs', ':Neotree float git_status<CR>', silent = true, desc = 'Neotree Open Git Status Window' },
      },
    },
  },
  config = function()
    -- If you want icons for diagnostic errors, you'll need to define them somewhere:
    vim.fn.sign_define('DiagnosticSignError', { text = ' ', texthl = 'DiagnosticSignError' })
    vim.fn.sign_define('DiagnosticSignWarn', { text = ' ', texthl = 'DiagnosticSignWarn' })
    vim.fn.sign_define('DiagnosticSignInfo', { text = ' ', texthl = 'DiagnosticSignInfo' })
    vim.fn.sign_define('DiagnosticSignHint', { text = '󰌵', texthl = 'DiagnosticSignHint' })

    require('neo-tree').setup {
      -- Close Neo-tree if it is the last window left in the tab
      close_if_last_window = false,
      popup_border_style = 'rounded',
      enable_git_status = true,
      enable_diagnostics = true,

      -- when opening files, do not use windows containing these filetypes or buftypes
      open_files_do_not_replace_types = { 'terminal', 'trouble', 'qf' },

      -- used when sorting files and directories in the tree
      sort_case_insensitive = false,

      -- use a custom function for sorting files and directories in the tree
      sort_function = nil,
      default_component_configs = {
        container = {
          enable_character_fade = true,
        },
        indent = {
          indent_size = 2,
          padding = 1,
          with_markers = true,
          indent_marker = '│',
          last_indent_marker = '└',
          highlight = 'NeoTreeIndentMarker',
          with_expanders = nil,
          expander_collapsed = '',
          expander_expanded = '',
          expander_highlight = 'NeoTreeExpander',
        },
        icon = {
          folder_closed = '',
          folder_open = '',
          folder_empty = '󰜌',

          -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
          -- then these will never be used.
          default = '*',
          highlight = 'NeoTreeFileIcon',
        },
        modified = {
          symbol = '[+]',
          highlight = 'NeoTreeModified',
        },
        name = {
          trailing_slash = false,
          use_git_status_colors = true,
          highlight = 'NeoTreeFileName',
        },
        git_status = {
          symbols = {
            -- or "✚", but this is redundant info if you use git_status_colors on the name
            added = '✚',

            -- or "", but this is redundant info if you use git_status_colors on the name
            modified = '',

            -- this can only be used in the git_status source
            deleted = '✖',

            -- this can only be used in the git_status source
            renamed = '󰁕',
            untracked = '',
            ignored = '',
            unstaged = '󰄱',
            staged = '',
            conflict = '',
          },
        },
        -- If you don't want to use these columns, you can set `enabled = false` for each of them individually
        file_size = {
          enabled = true,

          -- min width of window required to show this column
          required_width = 64,
        },
        type = {
          enabled = true,

          -- min width of window required to show this column
          required_width = 122,
        },
        last_modified = {
          enabled = true,

          -- min width of window required to show this column
          required_width = 88,
        },
        created = {
          enabled = true,

          -- min width of window required to show this column
          required_width = 110,
        },
        symlink_target = {
          enabled = false,
        },
      },

      -- A list of functions, each representing a global custom command
      -- that will be available in all sources (if not overridden in `opts[source_name].commands`)
      -- see `:h neo-tree-custom-commands-global`
      commands = {},
      window = {
        position = 'left',
        width = 40,
        mapping_options = {
          noremap = true,
          nowait = true,
        },
        mappings = {
          ['<space>'] = {
            'toggle_node',

            -- disable `nowait` if you have existing combos starting with this char that you want to use
            nowait = false,
          },
          ['<2-LeftMouse>'] = 'open',
          ['<cr>'] = 'open',

          -- close preview or floating neo-tree window
          ['<esc>'] = 'cancel',
          ['P'] = { 'toggle_preview', config = { use_float = true } },
          ['l'] = 'open',
          ['S'] = 'open_split',
          ['s'] = 'open_vsplit',
          ['t'] = 'open_tabnew',
          ['w'] = 'open_with_window_picker',
          ['C'] = 'close_node',
          ['z'] = 'close_all_nodes',
          ['a'] = {
            'add',

            -- this command supports BASH style brace expansion ("x{a,b,c}" -> xa,xb,xc). see `:h neo-tree-file-actions` for details
            -- some commands may take optional config options, see `:h neo-tree-mappings` for details
            config = {
              -- "none", "relative", "absolute"
              show_path = 'none',
            },
          },

          -- also accepts the optional config.show_path option like "add". this also supports BASH style brace expansion.
          ['A'] = 'add_directory',
          ['d'] = 'delete',
          ['r'] = 'rename',
          ['y'] = 'copy_to_clipboard',
          ['x'] = 'cut_to_clipboard',
          ['p'] = 'paste_from_clipboard',

          -- takes text input for destination, also accepts the optional config.show_path option like "add":
          ['c'] = 'copy',

          -- takes text input for destination, also accepts the optional config.show_path option like "add".
          ['m'] = 'move',
          ['q'] = 'close_window',
          ['R'] = 'refresh',
          ['?'] = 'show_help',
          ['<'] = 'prev_source',
          ['>'] = 'next_source',
          ['i'] = 'show_file_details',
        },
      },
      nesting_rules = {},
      filesystem = {
        filtered_items = {
          -- when true, they will just be displayed differently than normal items
          visible = false,
          hide_dotfiles = false,
          hide_gitignored = false,

          -- only works on Windows for hidden files/directories
          hide_hidden = false,
          hide_by_name = {
            '.DS_Store',
            'thumbs.db',
            'node_modules',
            '__pycache__',
            '.virtual_documents',
            '.git',
            '.python-version',
            '.venv',
          },

          -- uses glob style patterns
          hide_by_pattern = {
            --"*.meta",
            --"*/src/*/tsconfig.json",
          },

          -- remains visible even if other settings would normally hide it
          always_show = {
            --".gitignored",
          },

          -- remains hidden even if visible is toggled to true, this overrides always_show
          never_show = {
            --".DS_Store",
            --"thumbs.db"
          },

          -- uses glob style patterns
          never_show_by_pattern = {
            --".null-ls_*",
          },
        },

        -- This will find and focus the file in the active buffer every time
        -- the current file is changed while the tree is open.
        follow_current_file = {
          enabled = false,

          -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
          leave_dirs_open = false,
        },

        -- when true, empty folders will be grouped together
        group_empty_dirs = false,

        -- netrw disabled, opening a directory opens neo-tree in whatever position is specified in window.position
        -- "open_current",  netrw disabled, opening a directory opens within the
        -- window like netrw would, regardless of window.position
        -- "disabled",    -- netrw left alone, neo-tree does not handle opening dirs
        hijack_netrw_behavior = 'open_default',

        -- This will use the OS level file watchers to detect changes
        use_libuv_file_watcher = false,

        -- instead of relying on nvim autocmd events.
        window = {
          mappings = {
            ['<bs>'] = 'navigate_up',
            ['.'] = 'set_root',
            ['H'] = 'toggle_hidden',
            ['/'] = 'fuzzy_finder',
            ['D'] = 'fuzzy_finder_directory',

            -- fuzzy sorting using the fzy algorithm
            ['#'] = 'fuzzy_sorter',

            -- ["D"] = "fuzzy_sorter_directory",
            ['f'] = 'filter_on_submit',
            ['<c-x>'] = 'clear_filter',
            ['[g'] = 'prev_git_modified',
            [']g'] = 'next_git_modified',
            ['o'] = { 'show_help', nowait = false, config = { title = 'Order by', prefix_key = 'o' } },
            ['oc'] = { 'order_by_created', nowait = false },
            ['od'] = { 'order_by_diagnostics', nowait = false },
            ['og'] = { 'order_by_git_status', nowait = false },
            ['om'] = { 'order_by_modified', nowait = false },
            ['on'] = { 'order_by_name', nowait = false },
            ['os'] = { 'order_by_size', nowait = false },
            ['ot'] = { 'order_by_type', nowait = false },
          },

          -- define keymaps for filter popup window in fuzzy_finder_mode
          fuzzy_finder_mappings = {
            ['<down>'] = 'move_cursor_down',
            ['<C-n>'] = 'move_cursor_down',
            ['<up>'] = 'move_cursor_up',
            ['<C-p>'] = 'move_cursor_up',
          },
        },

        -- Add a custom command or override a global one using the same function name
        commands = {},
      },
      buffers = {
        follow_current_file = {
          -- This will find and focus the file in the active buffer every time
          -- the current file is changed while the tree is open.
          enabled = true,

          -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
          leave_dirs_open = false,
        },

        -- when true, empty folders will be grouped together
        group_empty_dirs = true,
        show_unloaded = true,
        window = {
          mappings = {
            ['bd'] = 'buffer_delete',
            ['<bs>'] = 'navigate_up',
            ['.'] = 'set_root',
            ['o'] = { 'show_help', nowait = false, config = { title = 'Order by', prefix_key = 'o' } },
            ['oc'] = { 'order_by_created', nowait = false },
            ['od'] = { 'order_by_diagnostics', nowait = false },
            ['om'] = { 'order_by_modified', nowait = false },
            ['on'] = { 'order_by_name', nowait = false },
            ['os'] = { 'order_by_size', nowait = false },
            ['ot'] = { 'order_by_type', nowait = false },
          },
        },
      },
      git_status = {
        window = {
          position = 'float',
          mappings = {
            ['A'] = 'git_add_all',
            ['gu'] = 'git_unstage_file',
            ['ga'] = 'git_add_file',
            ['gr'] = 'git_revert_file',
            ['gc'] = 'git_commit',
            ['gp'] = 'git_push',
            ['gg'] = 'git_commit_and_push',
            ['o'] = { 'show_help', nowait = false, config = { title = 'Order by', prefix_key = 'o' } },
            ['oc'] = { 'order_by_created', nowait = false },
            ['od'] = { 'order_by_diagnostics', nowait = false },
            ['om'] = { 'order_by_modified', nowait = false },
            ['on'] = { 'order_by_name', nowait = false },
            ['os'] = { 'order_by_size', nowait = false },
            ['ot'] = { 'order_by_type', nowait = false },
          },
        },
      },
    }

    vim.cmd [[nnoremap \ :Neotree reveal float<cr>]]
    vim.keymap.set('n', '\\', ':Neotree toggle position=float<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', '<leader>ngs', ':Neotree float git_status<CR>', { noremap = true, silent = true })
  end,
}
