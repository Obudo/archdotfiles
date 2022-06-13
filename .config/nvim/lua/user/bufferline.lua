local status_ok, bufferline = pcall(require, 'bufferline')
if not status_ok then
    vim.notify('Package colorizer not found')
    return
end

bufferline.setup {
    options = {
        mode = "buffers",
        numbers = "none",
        close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
        max_name_length = 18,
        max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
        tab_size = 18,
        diagnostics = "nvim_lsp",
        diagnostics_update_in_insert = false,
        color_icons = true, -- whether or not to add the filetype icon highlights
        show_buffer_icons = true, -- disable filetype icons for buffers
        show_buffer_close_icons = false,
        show_buffer_default_icon = true, -- whether or not an unrecognised filetype should show a default icon
        show_close_icon = false,
        show_tab_indicators = true,
        persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
        separator_style = "thick",
        enforce_regular_tabs = true,
        always_show_bufferline = true,
        sort_by = 'insert_after_current',
    }
}

local nmap = require('user.utils').nmap

nmap('<S-l>', ':BufferLineCycleNext<cr>')
nmap('<S-h>', ':BufferLineCyclePrev<cr>')
