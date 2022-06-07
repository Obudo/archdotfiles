local opt = vim.opt

-- Always use the system clipboard
opt.clipboard:append 'unnamedplus' 

-- More space in the neovim command line
opt.cmdheight = 2

-- Show menu for one entry only, force user selection
opt.completeopt = { 'menuone', 'noselect' }

-- Show concealed text
opt.conceallevel = 0

-- Silence errors
opt.errorbells = false

-- Encoding written to files
opt.fileencoding = 'utf-8'

-- Ignore case in search, unless capitalized letters are used
opt.ignorecase = true
opt.smartcase = true

-- Don't highlight searched words
opt.hlsearch = false

-- Enable mouse support
opt.mouse = 'a'

-- Number of popup menu entries
opt.pumheight = 10 

-- Hide mode in status bar
opt.showmode = false

-- Always show tabs
opt.showtabline = 2

-- Place all swapfiles in .vim/tmp 
table.insert(opt.directory, 1, '$HOME/.vim/tmp//')

-- Enables persistent undo for every file
opt.undofile = true

-- Enables 24-bit colors
opt.termguicolors = true

-- Convert tabs to 4 spaces, enable smartindent
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

-- Highlight current line
opt.cursorline = true

-- Set relative line numbers with current line having original number
opt.nu = true
opt.relativenumber = true

-- Show sign column and color column at 80 chars
opt.signcolumn = 'yes'
opt.colorcolumn = '80'

-- Scroll screen when 8 lines away from border
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Do not wrap text
opt.wrap = false

-- Prioritize project-specific .nvimrc files
opt.exrc = true

-- Don't automatically add comments after newline
vim.cmd [[au FileType * set fo-=c fo-=r fo-=o]]
