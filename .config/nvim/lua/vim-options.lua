vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.background = "light"

vim.opt.number = true
vim.wo.relativenumber = true


-- Set Python 3 host program
vim.g.python3_host_prog = "/usr/bin/python3"

-- Set Ruby host program (using symlinked path)
vim.g.ruby_host_prog = "/usr/bin/ruby"


-- Enable Ctrl + hjkl for pane navigation
-- vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

-- navigate vim panes better
-- vim.keymap.set('n', '<C-k>', ':wincmd k<CR>')
-- vim.keymap.set('n', '<C-j>', ':wincmd j<CR>')
-- vim.keymap.set('n', '<C-h>', ':wincmd h<CR>')
-- vim.keymap.set('n', '<C-l>', ':wincmd l<CR>')
