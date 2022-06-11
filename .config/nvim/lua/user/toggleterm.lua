local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
    vim.notify('Package toggleterm not found')
    return
end

local set_size = function(term)
    if term.direction == "horizontal" then
        return 15
    elseif term.direction == "vertical" then
        return vim.o.columns * 0.4
    end
end

toggleterm.setup {
    size = set_size,
    open_mapping = [[<c-q>]],
    direction = 'horizontal', -- 'vertical' | 'horizontal' | 'tab' | 'float',
    close_on_exit = false,
    float_opts = {
        border = 'curved',
    }
}

local keymap = vim.api.nvim_buf_set_keymap

function _G.set_terminal_keymaps()
    local opts = { noremap = true }
    keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
    keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
    keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
    keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
    -- Vertical movement commented out bc C-h is too useful
    -- Reenable for vertical terminal
    -- keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
    -- keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- local Terminal = require("toggleterm.terminal").Terminal
-- local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
--
-- function _LAZYGIT_TOGGLE()
--     lazygit:toggle()
-- end
--
-- local node = Terminal:new({ cmd = "node", hidden = true })
--
-- function _NODE_TOGGLE()
--     node:toggle()
-- end
--
-- local ncdu = Terminal:new({ cmd = "ncdu", hidden = true })
--
-- function _NCDU_TOGGLE()
--     ncdu:toggle()
-- end
--
-- local htop = Terminal:new({ cmd = "htop", hidden = true })
--
-- function _HTOP_TOGGLE()
--     htop:toggle()
-- end
--
-- local python = Terminal:new({ cmd = "python", hidden = true })
--
-- function _PYTHON_TOGGLE()
--     python:toggle()
-- end
