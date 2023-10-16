return {
    {
        "olimorris/onedarkpro.nvim",
        priority = 1000 -- Ensure it loads first
    },
    "nvim-lua/plenary.nvim",
    {
        "nvim-telescope/telescope.nvim", tag = "0.1.2",
        -- or                              , branch = "0.1.x",
        dependencies = { "nvim-lua/plenary.nvim" }
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function ()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = { "c", "lua", "vim", "vimdoc", "javascript", "html" },
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end
    },
    "christoomey/vim-tmux-navigator", -- Ctrl + motions to change split focus

    "tpope/vim-surround",

    "vim-scripts/ReplaceWithRegister", -- gr + motion

    "nvim-tree/nvim-tree.lua",

    "nvim-tree/nvim-web-devicons",

    "nvim-lualine/lualine.nvim",

    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",

    -- snippets
    "L3MON4D3/LuaSnip", -- snippet engine
    "saadparwaiz1/cmp_luasnip", -- for autocompletion
    "rafamadriz/friendly-snippets", -- useful snippets

    -- auto closing
    "windwp/nvim-autopairs", -- autoclose parens, brackets, quotes, etc...
    { "windwp/nvim-ts-autotag", after = "nvim-treesitter" }, -- autoclose tags

    -- managing & installing lsp servers, linters & formatters
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",

    { "VonHeikemen/lsp-zero.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",

        }
    },
    "lewis6991/gitsigns.nvim",
    { "mg979/vim-visual-multi", branch = "master" },
}
