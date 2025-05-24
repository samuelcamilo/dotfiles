return {
    'goolord/alpha-nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },

    config = function()
        local alpha = require 'alpha'
        local dashboard = require 'alpha.themes.dashboard'

        dashboard.section.header.val = {
            [[                                                                       ]],
            [[                                                                       ]],
            [[                                                                       ]],
            [[                                                                       ]],
            [[                                                                     ]],
            [[       ████ ██████           █████      ██                     ]],
            [[      ███████████             █████                             ]],
            [[      █████████ ███████████████████ ███   ███████████   ]],
            [[     █████████  ███    █████████████ █████ ██████████████   ]],
            [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
            [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
            [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
            [[                                                                       ]],
            [[                                                                       ]],
            [[                                                                       ]],
        }

        dashboard.section.buttons.val = {
            dashboard.button('n', ' New file', '<cmd>ene <BAR> startinsert <CR>'),
            dashboard.button('<leader> sf', ' Search File', '<cmd>Telescope find_files <CR>'),
            dashboard.button('<leader> sg', ' Search By Grep', '<cmd>Telescope live_grep <CR>'),
            dashboard.button('q', ' Close', '<cmd>q <CR>'),
        }
        dashboard.section.buttons.opts.hl = 'AlphaButtons'

        -- Layout
        dashboard.opts.layout = {
            { type = 'padding', val = 4 }, -- Upper margin
            dashboard.section.header,
            { type = 'padding', val = 2 }, -- Space between logo and buttons
            dashboard.section.buttons,
            { type = 'padding', val = 1 }, -- Space between buttons and recent files
            dashboard.section.footer,
        }

        -- Lazy Loading
        if vim.o.filetype == 'lazy' then
            vim.cmd.close()
            vim.api.nvim_create_autocmd('User', {
                once = true,
                pattern = 'AlphaReady',
                callback = function()
                    require('lazy').show()
                end,
            })
        end

        -- Set the dashbaord
        require('alpha').setup(dashboard.opts)

        -- Draw Footer After Startup
        vim.api.nvim_create_autocmd('User', {
            once = true,
            pattern = 'LazyVimStarted',
            callback = function()
                local stats = require('lazy').stats()
                local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)

                -- Footer
                dashboard.section.footer.val = '⚡ Neovim loaded ' ..
                stats.loaded .. '/' .. stats.count .. ' plugins in ' .. ms .. 'ms'
                pcall(vim.cmd.AlphaRedraw)
                dashboard.section.footer.opts.hl = 'AlphaFooter'
            end,
        })
    end,
}
