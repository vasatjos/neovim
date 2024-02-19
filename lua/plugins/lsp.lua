return {
    {
        "williamboman/mason.nvim",
        config = true
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
                ensure_installed = {
                    -- C/C++
                    "clangd",
                    "cmake",
                    -- python
                    "pylsp",
                    -- manualy install: mypy, pylint, blue, black
                    -- Lua
                    "lua_ls",
                    -- web dev
                    "html",
                    "cssls",
                    "tsserver",
                    -- bash
                    "bashls"
                },
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
        config = function ()
            local lsp = require("lsp-zero")
            lsp.preset("recommended")
            lsp.on_attach(function(_, bufnr)
                lsp.default_keymaps({ buffer = bufnr })
                vim.keymap.set("n", "<leader>gr", "<cmd>Telescope lsp_references<cr>", { buffer = true })
                vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, { buffer = true })
                vim.keymap.set("n", "<leader>afm", vim.lsp.buf.format, { buffer = true }) -- [A]uto [f]or[m]at
            end)
            lsp.setup()
        end
    }
}
