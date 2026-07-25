return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter").setup()

            vim.api.nvim_create_autocmd("FileType", {
                callback = function()
                    local ok, _ = pcall(vim.treesitter.start)
                    if not ok then
                        -- Fallback to regex-based highlighting if no parser available
                        vim.cmd("syntax enable")
                    end
                end,
            })

            require("nvim-treesitter.install").install({
                "bash",
                "c",
                "cpp",
                "css",
                "csv",
                "diff",
                "gitattributes",
                "gitcommit",
                "git_config",
                "gitignore",
                "git_rebase",
                "html",
                "javascript",
                "json",
                "julia",
                "lua",
                "make",
                "markdown",
                "python",
                "r",
                "racket",
                "rust",
                "sql",
                "typescript",
                "typst",
                "vim"
            })
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
