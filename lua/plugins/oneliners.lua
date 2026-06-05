vim.pack.add {
  'https://github.com/stevearc/oil.nvim',
  'https://github.com/norcalli/nvim-colorizer.lua',
  'https://github.com/ojroques/vim-oscyank',
  'https://github.com/tpope/vim-fugitive',
  'https://github.com/nvim-lualine/lualine.nvim',
}

-- Oil
require('oil').setup { view_options = { show_hidden = true } }
vim.keymap.set('n', '<leader>e', ':Oil<CR>')

-- Colorizer
vim.opt.termguicolors = true
require('colorizer').setup()

-- OSCYank
vim.keymap.set('n', 'Y', '<Plug>OSCYankOperator_')
vim.keymap.set('v', 'Y', '<Plug>OSCYankVisual')

-- Lualine
vim.opt.termguicolors = true
require('lualine').setup()
