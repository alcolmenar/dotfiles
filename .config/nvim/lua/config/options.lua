-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt
opt.colorcolumn = "100"
opt.relativenumber = true -- Relative line numbers

-- Don't auto comment new line created by hitting o
opt.formatoptions:remove("o")

vim.g.maplocalleader = ","
