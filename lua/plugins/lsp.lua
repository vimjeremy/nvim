vim.pack.add {
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/stevearc/conform.nvim',
  'https://github.com/saghen/blink.lib',
  'https://github.com/saghen/blink.cmp',
  'https://github.com/rafamadriz/friendly-snippets',
}

-- Basic configuration
vim.lsp.config('*', { root_markers = { '.git' } })
vim.diagnostic.config { virtual_text = true }

-- Set LSP servers and formatters
local servers = {
  'lua_ls',
  'nil_ls',
}

local formatters = {
  lua = { 'stylua' },
  nix = { 'alejandra' },
}

-- Completions and snippets
local cmp = require 'blink.cmp'
cmp.build():pwait()
cmp.setup {
  completion = { documentation = { auto_show = true }, trigger = { show_in_snippet = false } },
  sources = { default = { 'lsp', 'path', 'snippets', 'buffer' } },
  fuzzy = { implementation = 'rust' },

  keymap = { preset = 'default', ['<Tab>'] = { 'select_and_accept', 'snippet_forward', 'fallback' } },
}

-- Add extra filetypes
vim.filetype.add {
  extension = {
    h = 'c',
  },
}

-- Enable the defined servers and formatters
vim.lsp.enable(servers)
require('conform').setup {
  formatters_by_ft = formatters,
  format_on_save = {
    timeout_ms = 500,
    lsp_format = 'fallback',
  },
}
