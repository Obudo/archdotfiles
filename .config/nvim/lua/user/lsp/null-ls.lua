local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
    return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

null_ls.setup {
    cmd = { "nvim" },
    debounce = 250,
    debug = false,
    default_timeout = 5000,
    diagnostics_format = "#{m}",
    fallback_severity = vim.diagnostic.severity.ERROR,
    log = {
        enable = true,
        level = "warn",
        use_console = "async",
    },
    on_attach = nil,
    on_init = nil,
    on_exit = nil,
    update_in_insert = false,
    sources = {
        -- Actions to fix ESLint issues or to ignore broken rules
        code_actions.eslint_d,
        -- Refactoring library based off Martin Fowler's book
        code_actions.refactoring,
        -- Static analysis of C/C++ code
        diagnostics.cppcheck,
        -- Spell check codefiles
        diagnostics.eslint_d,
        -- Python code quality check
        diagnostics.flake8,
        -- CSS linter
        diagnostics.stylelint,
        -- Parsed diagnostics from tsc
        diagnostics.tsc,
        -- Python file formatter
        formatting.black,
        -- C/C++ code formatting
        formatting.clang_format,
        -- Front end code formatter
        formatting.prettierd,
        -- JSON formatter
        formatting.fixjson
    }
}

local keymap = vim.api.nvim_set_keymap
local std_opts = { noremap = true, silent = true }

-- Keymaps
keymap('n', "<leader>F", ":Format<cr>", std_opts)
