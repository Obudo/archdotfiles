local utils = {}
-- Set options for standard keymaps and terminal keymaps
local std_opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Utility functions
local keymap = vim.api.nvim_set_keymap

utils.map = function(lhs, rhs)
    return keymap('', lhs, rhs, std_opts)
end

utils.nmap = function (lhs, rhs)
    return keymap('n', lhs, rhs, std_opts)
end

utils.vmap = function (lhs, rhs)
    return keymap('v', lhs, rhs, std_opts)
end

utils.xmap = function (lhs, rhs)
    return keymap('x', lhs, rhs, std_opts)
end

utils.tmap = function (lhs, rhs)
    return keymap('t', lhs, rhs, term_opts)
end

return utils
