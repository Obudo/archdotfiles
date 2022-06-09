local autopairs_status_ok, autopairs = pcall(require, 'nvim-autopairs')
if not autopairs_status_ok then
    vim.notify('Package autopairs not found')
    return
end

autopairs.setup {
    check_ts = true,
    ts_config = {
        lua = {'string'},
        javascript = {'string'}
    },
    fast_wrap = {
        map = '<M-e>',
        chars = { '{', '[', '(', '"', "'" },
        pattern = [=[[%'%"%)%>%]%)%}%,]]=],
        end_key = '$',
        keys = 'qwertyuiopzxcvbnmasdfghjkl',
        check_comma = true,
        highlight = 'Search',
        highlight_grey='Comment'
    },
}

local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
local cmp_status_ok, cmp = pcall(require, 'cmp')
if not cmp_status_ok then
    vim.notify('Package cmp not found')
    return
end
cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done { map_char = { tex = '' } }
)

local autotags_status_ok, autotags = pcall(require, 'nvim-ts-autotag')
if not autotags_status_ok then
    vim.notify('Package autotags not found')
    return
end
autotags.setup()
