local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        'git',
        'clone',
        '--depth',
        '1',
        'https://github.com/wbthomason/packer.nvim',
        install_path,
    }
    print 'Installing packer, close and reopen Neovim'
    vim.cmd [[ packadd packer.nvim ]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]]

-- Use a protected call to avoid erroring out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
    vim.notify 'Failed to import packer'
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require('packer.util').float { border = 'rounded' }
        end,
    },
}

-- Install plugins here
return packer.startup(function (use)
    -- Bootstrap packer
    use 'wbthomason/packer.nvim'

    -- Start of plugins

    -- Commonly used helpers
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'

    -- Nord colorscheme
    use 'shaunsingh/nord.nvim'

    -- Statusline
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- Completion plugin + completition extensions
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer' -- buffer completions
    use 'hrsh7th/cmp-path' -- path completions
    use 'hrsh7th/cmp-cmdline' -- command line completions
    use 'saadparwaiz1/cmp_luasnip' -- snippet completions
    use 'hrsh7th/cmp-nvim-lsp' -- LSP completions
    use 'hrsh7th/cmp-nvim-lua' -- neovim Lua API

    -- Snippet Engine + snippets for various languages
    use 'L3MON4D3/LuaSnip'
    use 'rafamadriz/friendly-snippets'

    -- Language Server Provider
    use 'neovim/nvim-lspconfig'

    -- LSP installer
    use 'williamboman/nvim-lsp-installer'

    -- Incremental Renaming
    use 'smjonas/inc-rename.nvim'

    -- Telescope fuzzy finder
    use 'nvim-telescope/telescope.nvim'
    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
    }

    -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    }
    use "p00f/nvim-ts-rainbow"

    -- Colorize hex colors
    use 'norcalli/nvim-colorizer.lua'

    -- Autopairs for brackets, apexes and html tags
    use 'windwp/nvim-autopairs'
    use 'windwp/nvim-ts-autotag'

    -- Quickly comment/uncommment lines with context awareness
    use "numToStr/Comment.nvim"
    use 'JoosepAlviste/nvim-ts-context-commentstring'

    -- End of plugins

    -- Automatically set up your configuration after cloning packer.nvim
    if PACKER_BOOTSTRAP then
        require('packer').sync()
    end
end)
