vim.g.mapleader = ' '
local map = vim.api.nvim_set_keymap

-- Move in insert mode with C + hjkl
map('i', '<C-k>', '<Up>', { noremap = true})
map('i', '<C-j>', '<Down>', { noremap = true})
map('i', '<C-h>', '<Left>', { noremap = true})
map('i', '<C-l>', '<Right>', { noremap = true})

-- Disable arrow keys
map('n', '<Up>', '<nop>', {})
map('n', '<Down>', '<nop>', {})
map('n', '<Right>', '<nop>', {})
map('n', '<Left>', '<nop>', {})
map('i', '<Up>', '<nop>', {})
map('i', '<Down>', '<nop>', {})
map('i', '<Right>', '<nop>', {})
map('i', '<Left>', '<nop>', {})
