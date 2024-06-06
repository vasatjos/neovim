return {
    {
        "rebelot/kanagawa.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("kanagawa").setup({
                keywordStyle = { italic = false },
                -- Remove sign column background
                colors = {
                    theme = {
                        all = {
                            ui = { bg_gutter = "none" }
                        }
                    }
                },
                overrides = function(colors)
                    local theme = colors.theme
                    return {
                        -- make completions menu background darker
                        Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
                        PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
                        PmenuSbar = { bg = theme.ui.bg_m1 },
                        PmenuThumb = { bg = theme.ui.bg_p2 },
                    }
                end,
            })
            vim.cmd("colorscheme kanagawa-wave")
        end
    },
    "christoomey/vim-tmux-navigator",
    "tpope/vim-surround",
    {
        "numToStr/Comment.nvim",
        config = true
    },
    {
        "lewis6991/gitsigns.nvim",
        config = true
    },
}
