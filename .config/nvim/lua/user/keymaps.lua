local utils = require 'user.utils'
local map = utils.map
local nmap = utils.nmap
local vmap = utils.vmap
local xmap = utils.xmap
local tmap = utils.tmap

-- Remap Space as leader key
map('<Space>', '<Nop>')
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- NORMAL
-- Better window navigation
nmap('<C-h>', '<C-w>h')
nmap('<C-j>', '<C-w>j')
nmap('<C-k>', '<C-w>k')
nmap('<C-l>', '<C-w>l')

-- Close buffers
nmap('<leader>d', ':Bdelete!<cr>')

-- VISUAL
-- Hold the paste contents
vmap('p', '"_dP')

-- Stay in indent mode
vmap('>', '>gv')
vmap('<', '<gv')

-- Move line text up and down
vmap('<A-j>', ':m .+1<CR>==')
vmap('<A-k>', ':m .-2<CR>==')

-- VISUAL BLOCK
-- Move text block up and down
xmap("J", ":m '>+1<CR>gv-gv")
xmap("K", ":m '<-2<CR>gv-gv")
xmap("<A-j>", ":m '>+1<CR>gv-gv")
xmap("<A-k>", ":m '<-2<CR>gv-gv")

-- TERMINAL
-- Better terminal navigation
tmap("<C-h>", "<C-\\><C-N><C-w>h")
tmap("<C-j>", "<C-\\><C-N><C-w>j")
tmap("<C-k>", "<C-\\><C-N><C-w>k")
tmap("<C-l>", "<C-\\><C-N><C-w>l")
