return {
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "L3MON4D3/LuaSnip",             -- snippet engine
            "saadparwaiz1/cmp_luasnip",     -- for autocompletion
            "rafamadriz/friendly-snippets", -- useful snippets
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")
            require("luasnip/loaders/from_vscode").lazy_load()
            vim.opt.completeopt = "menu,menuone,noselect"
            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
                    ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
                    ["<C-p>"] = cmp.mapping.select_prev_item(), -- previous suggestion
                    ["<C-n>"] = cmp.mapping.select_next_item(), -- next suggestion
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),             -- show completion suggestions
                    ["<C-e>"] = cmp.mapping.abort(),                    -- close completion window
                    ["<Tab>"] = cmp.mapping.confirm({ select = true }),
                    ["<C-y"] = cmp.mapping.confirm({ select = true }),
                    ["<CR>"] = cmp.mapping.confirm({ select = false }),
                }),

                -- sources for autocompletion
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" }, -- snippets
                    { name = "buffer" },  -- text within current buffer
                    { name = "path" },    -- file system paths
                }),
            })
            cmp.setup.cmdline('/', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = 'buffer' },
                    { name = 'path' }
                }
            })
            cmp.setup.cmdline(':', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = 'path' }
                }, {
                    {
                        name = 'cmdline',
                        option = {
                            ignore_cmds = { 'Man', }
                        }
                    }
                })
            })
        end
    }
}
