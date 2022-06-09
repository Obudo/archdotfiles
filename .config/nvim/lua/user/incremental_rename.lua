if vim.fn.has('nvim-0.8') == 0 then
    return
end

vim.notify 'Remove version check from incremental_rename.lua'


local status_ok, inc_rename = pcall(require, 'inc_rename')
if not status_ok then
    vim.notify('Package inc_rename not found')
    return
end

inc_rename.setup()

local rename = function ()
   return ':IncRename ' .. vim.fn.expand('<cword>')
end

vim.keymap.set('n', '<leader>rn', rename, { expr = true })
