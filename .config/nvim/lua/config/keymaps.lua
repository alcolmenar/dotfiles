-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set({ "i", "n", "v", "x", "s", "c", "o", "l", "t" }, "<C-q>", "<Cmd>qa<CR>")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll Down Half" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll Up Half" })
vim.keymap.set("n", "<C-f>", "<C-f>zz", { desc = "Scroll Down" })
vim.keymap.set("n", "<C-b>", "<C-b>zz", { desc = "Scroll Up" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Next Search Result" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Prev Search Result" })

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set("n", ";", ":")
vim.keymap.set("n", "<leader>y", "<Cmd>let @+ = @%<CR>", { desc = "Yank current file path" })
