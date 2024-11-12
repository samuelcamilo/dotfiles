-- Conform provides tools for defining and enforcing coding style rules across a codebase.
-- Users can configure various formatting options such as indentation, line length, spacing,
-- and more according to the project's coding standards or personal preferences.

return {
	"stevearc/conform.nvim",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				json = { "prettier" },
				go = { "gofumpt", "goimports-reviser", "golines" },
				lua = { "stylua" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			},
		})
	end,
}
