return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  opts = {
    options = {
      diagnostics = 'nvim_lsp',
      offsets = {
        {
          filetype = 'snacks_layout_box',
          text = '󰙅  File Explorer',
          separator = true,
        },
        color_icons = true,
      },
    },
  },
  config = function(_, opts)
    require('bufferline').setup(opts)
  end,
}
