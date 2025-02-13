-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps herea

local keymap = vim.keymap

-- Removing unsued keymaps.
keymap.del("n", "<leader>/", {})
keymap.del("n", "<leader><space>", {})
