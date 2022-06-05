local o = vim.o
local wo = vim.wo
local bo = vim.bo

o.exrc = true
o.hlsearch = false
o.hidden = true
o.errorbells = false
o.incsearch = true
o.termguicolors = true
o.scrolloff = 10

wo.relativenumber = true
wo.nu = true
wo.wrap = false
wo.signcolumn = 'yes'
wo.colorcolumn = '80'

bo.tabstop = 4
bo.softtabstop = 4
bo.shiftwidth = 4
bo.expandtab = true
bo.smartindent = true

vim.cmd('colorscheme nord')
