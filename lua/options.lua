vim.o.shiftwidth = 2
vim.o.tabstop = 2

vim.o.nu = true
vim.o.cursorline = true
vim.o.signcolumn = 'yes'
vim.o.relativenumber = true

vim.o.splitbelow = true
vim.o.splitright = true

vim.o.linebreak = true

vim.o.swapfile = false
vim.o.undofile = true
vim.o.undodir = os.getenv 'HOME' .. '/.cache/nvim/undodir'
