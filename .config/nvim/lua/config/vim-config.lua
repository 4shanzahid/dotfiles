-- Set options
vim.o.scrolloff = 20
vim.o.number = true
vim.o.relativenumber = true

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.autoindent = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.o.cursorline = true

-- Set leader key
vim.g.mapleader = " "

-- Key mappings
vim.api.nvim_set_keymap('n', '<leader>e', ':Ex<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader><CR>', ':so ~/.config/nvim/init.lua<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<Leader>y', '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-s>', ':wa<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>q', ':wq<CR>', { noremap = true, silent = true })

