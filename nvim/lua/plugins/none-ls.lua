-- Integrates formatters and linters (e.g., stylua, gofumpt, prettier) into Neovim’s LSP framework.
-- Auto-formats code on save and ensures tools are installed via Mason,
-- enhancing code quality and consistency.

return {
  'nvimtools/none-ls.nvim',
  dependencies = {
    'nvimtools/none-ls-extras.nvim',
    'jayp0521/mason-null-ls.nvim',
  },
  config = function()
    local null_ls = require 'null-ls'
    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics

    -- list of formatters & linters for mason to install
    require('mason-null-ls').setup {
      ensure_installed = {
        'stylua',
        'gofumpt',
        'goimports',
        'checkmake',
        'terraform',
      },
      -- auto-install configured formatters & linters (with null-ls)
      automatic_installation = false,
    }

    local sources = {
      formatting.stylua,
      formatting.gofumpt,
      formatting.goimports,
      diagnostics.checkmake.with {
        extra_args = { '--ignore', 'minphony' },
      },
      formatting.prettier.with { filetypes = { 'json', 'yaml', 'markdown' } },
      formatting.terraform_fmt,
    }

    local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
    null_ls.setup {
      sources = sources,
      on_attach = function(client, bufnr)
        if client.supports_method 'textDocument/formatting' then
          vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
          vim.api.nvim_create_autocmd('BufWritePre', {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format { async = false }
            end,
          })
        end
      end,
    }
  end,
}
