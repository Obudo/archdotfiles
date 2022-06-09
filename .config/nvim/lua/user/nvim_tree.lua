local status_ok, nvim_tree = pcall(require, 'nvim-tree')
if not status_ok then
    return
end

vim.nvim_tree_icons = {
    default = '',
    symlink = '',
    git = {
        unstaged = '',
        staged = 'S',
        unmerged = '',
        renamed = '➜',
        deleted = '',
        untracked = 'U',
        ignored = '◌',
    },
    folder = {
        default = '',
        open = '',
        empty = '',
        empty_open = '',
        symlink = '',
    },
}

nvim_tree.setup {
  view = {
    adaptive_size = false,
    centralize_selection = false,
    width = 30,
    height = 30,
    hide_root_folder = false,
    side = "left",
    preserve_window_proportions = false,
    number = false,
    relativenumber = false,
    signcolumn = "yes",
    mappings = {
      custom_only = false,
      list = {
        -- user mappings go here
      },
    },
  },
  renderer = {
    add_trailing = false,
    group_empty = false,
    highlight_git = false,
    full_name = false,
    highlight_opened_files = "none",
    root_folder_modifier = ":~",
    indent_markers = {
      enable = true,
      icons = {
        corner = "└ ",
        edge = "│ ",
        item = "│ ",
        none = "  ",
      },
    },
    icons = {
      webdev_colors = true,
      git_placement = "before",
      padding = " ",
      symlink_arrow = " ➛ ",
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
      glyphs = {
        default = "",
        symlink = "",
        folder = {
          arrow_closed = "",
          arrow_open = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌",
        },
      },
    },
    special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
  },
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  update_focused_file = {
    enable = false,
    update_cwd = false,
    ignore_list = {},
  },
  ignore_ft_on_setup = {},
  system_open = {
    cmd = "",
    args = {},
  },
  diagnostics = {
    enable = false,
    show_on_dirs = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  filters = {
    dotfiles = false,
    custom = {},
    exclude = {},
  },
  filesystem_watchers = {
    enable = false,
    interval = 100,
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 400,
  },
  actions = {
    use_system_clipboard = true,
    change_dir = {
      enable = true,
      global = false,
      restrict_above_cwd = false,
    },
    expand_all = {
      max_folder_discovery = 300,
    },
    open_file = {
      quit_on_open = false,
      resize_window = true,
      window_picker = {
        enable = true,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
          buftype = { "nofile", "terminal", "help" },
        },
      },
    },
    remove_file = {
      close_window = true,
    },
  },
  trash = {
    cmd = "gio trash",
    require_confirm = true,
  },
  live_filter = {
    prefix = "[FILTER]: ",
    always_show_folders = true,
  },
}

-- BEGIN_DEFAULT_MAPPINGS
-- { key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" }
-- { key = "<C-e>",                          action = "edit_in_place" }
-- { key = "O",                              action = "edit_no_picker" }
-- { key = { "<C-]>", "<2-RightMouse>" },    action = "cd" }
-- { key = "<C-v>",                          action = "vsplit" }
-- { key = "<C-x>",                          action = "split" }
-- { key = "<C-t>",                          action = "tabnew" }
-- { key = "<",                              action = "prev_sibling" }
-- { key = ">",                              action = "next_sibling" }
-- { key = "P",                              action = "parent_node" }
-- { key = "<BS>",                           action = "close_node" }
-- { key = "<Tab>",                          action = "preview" }
-- { key = "K",                              action = "first_sibling" }
-- { key = "J",                              action = "last_sibling" }
-- { key = "I",                              action = "toggle_git_ignored" }
-- { key = "H",                              action = "toggle_dotfiles" }
-- { key = "U",                              action = "toggle_custom" }
-- { key = "R",                              action = "refresh" }
-- { key = "a",                              action = "create" }
-- { key = "d",                              action = "remove" }
-- { key = "D",                              action = "trash" }
-- { key = "r",                              action = "rename" }
-- { key = "<C-r>",                          action = "full_rename" }
-- { key = "x",                              action = "cut" }
-- { key = "c",                              action = "copy" }
-- { key = "p",                              action = "paste" }
-- { key = "y",                              action = "copy_name" }
-- { key = "Y",                              action = "copy_path" }
-- { key = "gy",                             action = "copy_absolute_path" }
-- { key = "[c",                             action = "prev_git_item" }
-- { key = "]c",                             action = "next_git_item" }
-- { key = "-",                              action = "dir_up" }
-- { key = "s",                              action = "system_open" }
-- { key = "f",                              action = "live_filter" }
-- { key = "F",                              action = "clear_live_filter" }
-- { key = "q",                              action = "close" }
-- { key = "W",                              action = "collapse_all" }
-- { key = "E",                              action = "expand_all" }
-- { key = "S",                              action = "search_node" }
-- { key = ".",                              action = "run_file_command" }
-- { key = "<C-k>",                          action = "toggle_file_info" }
-- { key = "g?",                             action = "toggle_help" }
-- END_DEFAULT_MAPPINGS

local keymap = vim.api.nvim_set_keymap
local std_opts = { noremap = true, silent = true }

keymap('n', '<leader>e', ':NvimTreeToggle<cr>', std_opts)
