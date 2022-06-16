local status_ok, onenord = pcall(require, 'onenord')
if not status_ok then
    vim.notify('Plugin onenord not found')
    return
end

onenord.setup {
}
