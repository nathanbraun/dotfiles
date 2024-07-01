-- local status_ok, _ = pcall(require, "lspconfig")
-- if not status_ok then
-- 	return
-- end

-- require("user.lsp.lsp-installer")
-- require("user.lsp.handlers").setup()

local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})

  vim.keymap.set({'n', 'x'}, '<leader>f', function()
    vim.lsp.buf.format({async = false, timeout_ms = 10000})
  end, opts)
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  -- Replace the language servers listed here
  -- with the ones you want to install
  ensure_installed = {'elmls', 'pyright', 'tsserver', 'hls'},
  handlers = {
    lsp_zero.default_setup,
  }
})

lsp_zero.set_sign_icons({
  error = '✘',
  warn = '▲',
  hint = '⚑',
  info = '»'
})
