return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter").setup()
            require("nvim-treesitter.install").install({ "c", "cpp", "python", "lua" })
        end
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        config = function()
            require('treesitter-context').setup({
                max_lines = 5, -- How many lines the window should span. Values <= 0 mean no limit.
            })
        end
    },
}
