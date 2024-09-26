require('bufferline').setup({
  options = {
    indicator = {
      icon = ' ',
    },
    show_close_icon = false,
    tab_size = 0,
    max_name_length = 25,
    offsets = {
      {
        filetype = 'NvimTree',
        text = '  Files',
        highlight = 'NvimTreeNormal',
        text_align = 'left',
      },
    },
    separator_style = 'slant',
    modified_icon = '',
    custom_areas = {
      left = function()
        return {
          { text = '    ', fg = '#8fff6d' },
        }
      end,
    },
  },
  highlights = {
    fill = {
      bg = '#21222c',
    },
    background = {
      bg = '#282a36',
    },
    close_button = {
      bg = '#282a36',
    },
    buffer_visible = {
      bg = '#282a36',
    },
    close_button_visible = {
      bg = '#282a36',
    },
  }
})
