require('nvim-tree').setup({
    actions = {
      open_file = {
        quit_on_open = true,
      },
    },
    git = {
      ignore = false,
    },
    filters = {
        custom = {
            '.DS_Store'
        },
    },
    renderer = {
      group_empty = true,
      icons = {
        show = {
          folder_arrow = false,
        },
      },
      indent_markers = {
        enable = true,
      },
    },
  })

  vim.keymap.set('n', '<Leader>e', ':NvimTreeFindFileToggle<CR>')
