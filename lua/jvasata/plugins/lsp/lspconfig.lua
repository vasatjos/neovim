local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })

    vim.keymap.set("n", "<leader>gr", "<cmd>Telescope lsp_references<cr>", { buffer = true })
    vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, { buffer = true })
    vim.keymap.set("n", "<leader>afm", vim.lsp.buf.format, { buffer = true }) -- [A]uto [f]or[m]at
end)

lsp.setup()
