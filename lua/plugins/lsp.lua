local servers = {
    -- C/C++
    "clangd",
    "cmake",
    -- python
    "pyright",
    -- Lua
    "lua_ls",
    -- web dev
    "html",
    "cssls",
    "ts_ls",
    -- shell
    "bashls",
    -- rust
    "rust_analyzer",
}

return {
    {
        "williamboman/mason.nvim",
        config = true
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
        },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = servers
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            local lsp = require("lspconfig")
            -- default server configs, overrides after loop possible
            for _, server in ipairs(servers) do
                lsp[server].setup({})
            end

            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('UserLspConfig', {}),
                callback = function(ev)
                    local builtin = require("telescope.builtin")
                    local opts = { buffer = ev.buf }
                    vim.keymap.set('n', 'gd', builtin.lsp_definitions, opts)
                    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                    vim.keymap.set("n", "gr", builtin.lsp_references, opts)
                    vim.keymap.set('n', '<leader>ds', builtin.lsp_document_symbols, opts)
                    vim.keymap.set('n', 'gi', builtin.lsp_implementations, opts)
                    vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
                    vim.keymap.set({ "n", "x" }, "<leader>afm", vim.lsp.buf.format, opts) -- [A]uto [f]or[m]at
                    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                    vim.keymap.set('n', 'gl', vim.diagnostic.open_float, opts)
                    vim.keymap.set('n', 'go', builtin.lsp_type_definitions, opts)
                    vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, opts)
                    vim.keymap.set('n', '<leader>gr', vim.lsp.buf.rename, opts)
                    vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, opts)
                    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
                    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
                end
            })
        end
    },
    {
        "nvimtools/none-ls.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "jay-babu/mason-null-ls.nvim"
        },
        event = "VeryLazy",
        config = function()
            require("mason").setup()
            require("null-ls").setup()
            require("mason-null-ls").setup({
                ensure_installed = {
                    -- python
                    "black",
                    -- web dev
                    "prettierd",
                    "eslint_d",
                },
                handlers = {},
            })
        end
    }
}
