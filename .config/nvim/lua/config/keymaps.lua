-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- vim.keymap.del({ "n", "t" }, "<C-k>")
vim.keymap.set({ "i", "n", "v", "x", "s", "c", "o", "l", "t" }, "<C-k>", "<Esc>")
vim.keymap.set({ "i", "n", "v", "x", "s", "c", "o", "l", "t" }, "<C-q>", "<Cmd>qa<CR>")
