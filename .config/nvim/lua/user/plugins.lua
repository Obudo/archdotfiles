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
    -- WIP
    -- use 'nvim-lualine/lualine.nvim'

    -- End of plugins

    -- Automatically set up your configuration after cloning packer.nvim
    if PACKER_BOOTSTRAP then
        require('packer').sync()
    end
end)
