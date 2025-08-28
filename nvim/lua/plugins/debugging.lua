return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'rcarriga/nvim-dap-ui',
      'leoluz/nvim-dap-go',
      'nvim-neotest/nvim-nio',
    },
    config = function()
      local dap, dapui = require 'dap', require 'dapui'

      require('dapui').setup()
      require('dap-go').setup()

      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end

      dap.configurations.go = {
        {
          type = 'go',
          name = 'API - Debug',
          request = 'launch',
          program = '${workspaceFolder}/app/service/api',
          outputMode = 'remote',
          dlvToolPath = vim.fn.exepath 'dlv',
        },
      }

      vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
      vim.keymap.set('n', '<leader>dB', function()
        dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
      end, { desc = 'Debug: Set Breakpoint' })

      vim.keymap.set('n', '<leader>dc', dap.continue, { desc = 'Run/Continue' })
      vim.keymap.set('n', '<F2>', dap.step_over, { desc = 'Step Over' })
      vim.keymap.set('n', '<F3>', dap.step_into, { desc = 'Step Into' })
      vim.keymap.set('n', '<F4>', dap.step_out, { desc = 'Step Out' })
      vim.keymap.set('n', '<leader>dP', dap.pause, { desc = 'Pause' })
      vim.keymap.set('n', '<leader>dr', dap.repl.toggle, { desc = 'Toggle REPL' })
      vim.keymap.set('n', '<leader>dS', dap.session, { desc = 'Session' })
      vim.keymap.set('n', '<leader>dt', dap.terminate, { desc = 'Terminate' })
      vim.keymap.set('n', '<leader>dw', function()
        require('dap.ui.widgets').hover()
      end, { desc = 'Widgets' })

      vim.fn.sign_define('DapBreakpoint',
        { text = '⏺', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })

      -- Dap UI setup
      -- For more information, see |:help nvim-dap-ui|
      dapui.setup {
        -- Set icons to characters that are more likely to work in every terminal.
        --    Feel free to remove or use ones that you like more! :)
        --    Don't feel like these are good choices.
        icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
        controls = {
          enabled = false,
          icons = {
            pause = '⏸',
            play = '▶',
            step_into = '⏎',
            step_over = '⏭',
            step_out = '⏮',
            step_back = 'b',
            run_last = '▶▶',
            terminate = '⏹',
            disconnect = '⏏',
          },
        },
        layouts = {
          {
            elements = {
              -- {
              --   id = 'scopes',
              --   size = 0.5,
              -- },
              -- {
              --   id = 'breakpoints',
              --   size = 0.5,
              -- },
              -- {
              --   id = 'stacks',
              --   size = 0.25,
              -- },
              -- {
              --   id = 'watches',
              --   size = 0.25,
              -- },
            },
            position = 'right',
            size = 50,
          },
          {
            elements = {
              {
                id = 'repl',
                size = 1.0,
              },
              -- {
              --   id = 'console',
              --   size = 0.5,
              -- },
            },
            position = 'bottom',
            size = 10,
          },
        },
      }
    end,
  },
}
