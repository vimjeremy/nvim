vim.pack.add { 'https://github.com/nvim-mini/mini.nvim' }

-- File picker
require('mini.pick').setup()
require('mini.extra').setup()
vim.keymap.set('n', '<leader>ff', ':Pick files<CR>')
vim.keymap.set('n', '<leader>fg', ':Pick grep_live<CR>')
vim.keymap.set('n', '<leader>fb', ':Pick buffers<CR>')
vim.keymap.set('n', '<leader>fh', ':Pick help<CR>')
vim.keymap.set('n', '<leader>fl', ':Pick diagnostic<CR>')

-- Oneliners
require('mini.icons').setup()
require('mini.move').setup()
require('mini.pairs').setup()
require('mini.surround').setup()
require('mini.ai').setup()
