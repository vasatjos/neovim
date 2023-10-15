local lsp = require ("lsp-zero")

lsp.preset("recommended")

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})

  vim.keymap.set('n', '<leader>gr', '<cmd>Telescope lsp_references<cr>', {buffer = true})
end)

lsp.setup()
