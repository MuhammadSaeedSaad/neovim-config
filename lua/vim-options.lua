-- Set basic options
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.g.mapleader = " "
vim.g.hlsearch = false
vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.wrap = true
vim.opt.termguicolors = false
vim.opt.number = true         -- show absolute number on current line
vim.opt.relativenumber = true -- show relative numbers on other lines

vim.keymap.set('i', '<C-h>', '<Left>', {})
vim.keymap.set('i', '<C-l>', '<Right>', {})
vim.keymap.set('i', '<C-k>', '<Up>', {})
vim.keymap.set('i', '<C-j>', '<Down>', {})
