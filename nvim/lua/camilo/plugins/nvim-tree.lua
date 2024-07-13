-- Like nvim-tree, nvim-tree.lua provides a file explorer sidebar for Neovim,
-- allowing users to browse and manage files and directories within their
-- projects directly from Neovim.

return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
	},
}
