local keymap = vim.api.nvim_set_keymap
local std_opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Remap Space as leader key
keymap('', '<Space>', '<Nop>', std_opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- NORMAL
-- Better window navigation
keymap('n', '<C-h>', '<C-w>h', std_opts)
keymap('n', '<C-j>', '<C-w>j', std_opts)
keymap('n', '<C-k>', '<C-w>k', std_opts)
keymap('n', '<C-l>', '<C-w>l', std_opts)

-- Close buffers
keymap('n', '<leader>d', ':bd<CR>', std_opts)

-- VISUAL
-- Hold the paste contents
keymap('v', 'p', '"_dP', std_opts)

-- Stay in indent mode
keymap('v', '>', '>gv', std_opts)
keymap('v', '<', '<gv', std_opts)

-- Move line text up and down
keymap('v', '<A-j>', ':m .+1<CR>==', std_opts)
keymap('v', '<A-k>', ':m .-2<CR>==', std_opts)

-- VISUAL BLOCK
-- Move text block up and down
keymap('x', "J", ":m '>+1<CR>gv-gv", std_opts)
keymap('x', "K", ":m '<-2<CR>gv-gv", std_opts)
keymap('x', "<A-j>", ":m '>+1<CR>gv-gv", std_opts)
keymap('x', "<A-k>", ":m '<-2<CR>gv-gv", std_opts)

-- TERMINAL
-- Better terminal navigation
keymap('t', "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap('t', "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap('t', "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap('t', "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
