local status_ok, git_conflict = pcall(require, 'git-conflict')
if not status_ok then
    vim.notify('Package git-conflict not found')
    return
end

git_conflict.setup {
  default_mappings = true, -- disable buffer local mapping created by this plugin
  disable_diagnostics = false, -- This will disable the diagnostics in a buffer whilst it is conflicted
  highlights = { -- They must have background color, otherwise the default color will be used
    incoming = 'DiffText',
    current = 'DiffAdd',
  }
}

local nmap = require('user.utils').nmap

nmap('co', '<Plug>(git-conflict-ours)')
nmap('ct', '<Plug>(git-conflict-theirs)')
nmap('cb', '<Plug>(git-conflict-both)')
nmap('c0', '<Plug>(git-conflict-none)')
nmap(']x', '<Plug>(git-conflict-prev-conflict)')
nmap('[x', '<Plug>(git-conflict-next-conflict)')
