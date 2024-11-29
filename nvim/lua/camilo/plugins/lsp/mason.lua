return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason = require("mason") -- import mason
		local mason_lspconfig = require("mason-lspconfig") -- import mason-lspconfig
		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			ensure_installed = {
				"gopls",
				"rust_analyzer",
				"tsserver",
				"sqls",
				"lua_ls",
			},
			automatic_installation = true, -- auto-install configured servers (with lspconfig)
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"gofumpt",
				"goimports-reviser",
				"golines",
				"stylua",
			},
		})
	end,
}
