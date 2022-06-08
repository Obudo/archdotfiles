local status_ok, configs = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
    vim.notify 'nvim-treesitter not installed'
    return
end

configs.setup {
    ensure_installed = {
        'bash',
        'c',
        'cpp',
        'comment',
        'css',
        'go',
        'graphql',
        'html',
        'javascript',
        'jsdoc',
        'json',
        'jsonc',
        'lua',
        'prisma',
        'python',
        'regex',
        'typescript',
        'yaml'
    },
    sync_install = false,
    highlight = {
        enable = true, -- false will disable the whole extension
        disable = { "" }, -- list of language that will be disabled
        additional_vim_regex_highlighting = true,

    },
    indent = { enable = true, disable = { "yaml" } },
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil
    }
}

