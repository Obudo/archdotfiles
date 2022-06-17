local utils = {}

-- Use a factory function to create the mapping functions
local create_mapper = function(mode, opts)
    return function(lhs, rhs)
        return vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
    end
end

local std_opts = { noremap = true, silent = true }
local term_opts = { silent = true }

utils.map = create_mapper('', std_opts)
utils.nmap = create_mapper('n', std_opts)
utils.imap = create_mapper('i', std_opts)
utils.vmap = create_mapper('v', std_opts)
utils.xmap = create_mapper('x', std_opts)
utils.tmap = create_mapper('t', term_opts)

return utils
