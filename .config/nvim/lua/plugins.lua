require('packer').startup(function(use)
    -- Package Manager
    use 'wbthomason/packer.nvim'

    --  color theme
    use 'shaunsingh/nord.nvim'
    use 'ellisonleao/gruvbox.nvim'

    -- Improved GUI
    use 'neovide/neovide/'

    -- Colorizer
    use 'norcalli/nvim-colorizer.lua'

    -- Collection of configurations for the built-in LSP client
    use 'neovim/nvim-lspconfig'

    -- Fuzzy Finder
    use { 
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/plenary.nvim'} }
    }
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
end)

-- Setup plugins

local lsp = require'lspconfig'

lsp.tsserver.setup({})
lsp.clangd.setup({})

require 'colorizer'.setup { '*' }
