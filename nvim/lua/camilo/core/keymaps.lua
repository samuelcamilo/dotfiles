vim.g.mapleader = " " -- set leader key to space

local keymap = vim.keymap -- for conciseness

keymap.set("n", "<leader>e", ":Neotree filesystem reveal float<CR>", { desc = "Explorer" }) -- Show Telescope Options
keymap.set("n", "<leader>f", "", { desc = "Find Options (Telescope)" }) -- Show Telescope Options
