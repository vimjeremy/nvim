vim.pack.add { 'https://github.com/folke/tokyonight.nvim' }

vim.opt.termguicolors = true
vim.cmd.colorscheme 'tokyonight-night'
vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#c0caf5' })
