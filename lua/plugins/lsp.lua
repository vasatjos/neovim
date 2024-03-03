return {
    {
        "williamboman/mason.nvim",
        config = function ()
            require("mason").setup({
                ensure_installed = {
                    -- C/C++
                    "clangd",
                    "cmake",
                    -- python
                    "jedi_language_server",
                    -- Lua
                    "lua_ls",
                    -- web dev
                    "html",
                    "cssls",
                    "tsserver",
                    -- bash
                    "bashls"
                }
            })
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "VonHeikemen/lsp-zero.nvim",
            dependencies = {
                "neovim/nvim-lspconfig",
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-nvim-lua",
            }
        },
        config = function()
            local lsp = require("lsp-zero")
            local mason_lspconfig = require("mason-lspconfig")
            mason_lspconfig.setup({
                handlers = {
                    lsp.default_setup,
                },
            })
        end
    },
    {
        "VonHeikemen/lsp-zero.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
        },
        config = function()
            local lsp = require("lsp-zero")
            lsp.preset("recommended")
            lsp.on_attach(function(_, bufnr)
                lsp.default_keymaps({ buffer = bufnr })
                vim.keymap.set("n", "<leader>gr", "<cmd>Telescope lsp_references<cr>", { buffer = true })
                vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, { buffer = true })
                vim.keymap.set({ "n", "x" }, "<leader>afm", vim.lsp.buf.format, { buffer = true }) -- [A]uto [f]or[m]at
                vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', { buffer = true })
                vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', { buffer = true })
                vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', { buffer = true })
                vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', { buffer = true })
                vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', { buffer = true })
                vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', { buffer = true })
                vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', { buffer = true })
                vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', { buffer = true })
                vim.keymap.set('n', '<leader>sd', '<cmd>lua vim.diagnostic.open_float()<cr>', { buffer = true })
                vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', { buffer = true })
                vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', { buffer = true })
            end)
            lsp.setup()
        end
    },
    {
        "nvimtools/none-ls.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "jay-babu/mason-null-ls.nvim"
        },
        config = function()
            require("mason").setup()
            require("null-ls").setup()
            require("mason-null-ls").setup({
                handlers = {},
            })
            vim.keymap.set("n", "<leader>afm", vim.lsp.buf.format, {}) -- [A]uto [f]or[m]at
        end
    },
}
