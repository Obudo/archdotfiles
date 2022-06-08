-- Set options for standard keymaps and terminal keymaps
local std_opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Utility functions
local keymap = vim.api.nvim_set_keymap

local nmap = function (lhs, rhs)
    return keymap('n', lhs, rhs, std_opts)
end

local vmap = function (lhs, rhs)
    return keymap('v', lhs, rhs, std_opts)
end

local xmap = function (lhs, rhs)
    return keymap('x', lhs, rhs, std_opts)
end

local tmap = function (lhs, rhs)
    return keymap('t', lhs, rhs, term_opts)
end

-- Remap Space as leader key
keymap('', '<Space>', '<Nop>', std_opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Normal
-- Better window navigation
nmap('<C-h>', '<C-w>h')
nmap('<C-j>', '<C-w>j')
nmap('<C-k>', '<C-w>k')
nmap('<C-l>', '<C-w>l')

nmap('<leader>e', ':Lex 30<cr>')

-- Navigate buffers
nmap('<leader>l', ':bn<CR>')
nmap('<leader>h', ':bp<CR>')
nmap('<leader>d', ':bd<CR>')

-- Visual
-- Hold the paste contents
vmap('p', '"_dP')

-- Stay in indent mode
vmap('>', '>gv')
vmap('<', '<gv')

-- Move line text up and down
vmap('<A-j>', ':m .+1<CR>==')
vmap('<A-k>', ':m .-2<CR>==')

-- Visual Block
-- Move text block up and down
xmap("J", ":m '>+1<CR>gv-gv")
xmap("K", ":m '<-2<CR>gv-gv")
xmap("<A-j>", ":m '>+1<CR>gv-gv")
xmap("<A-k>", ":m '<-2<CR>gv-gv")

-- Terminal --
-- Better terminal navigation
tmap("<C-h>", "<C-\\><C-N><C-w>h")
tmap("<C-j>", "<C-\\><C-N><C-w>j")
tmap("<C-k>", "<C-\\><C-N><C-w>k")
tmap("<C-l>", "<C-\\><C-N><C-w>l")

-- Telescope --
nmap("<leader>f", "<cmd>Telescope find_files<cr>")
-- nmap("<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>")
nmap("<c-t>", "<cmd>Telescope live_grep<cr>")
