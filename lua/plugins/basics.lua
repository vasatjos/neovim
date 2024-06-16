return {
    -- {
    --     "rebelot/kanagawa.nvim",
    --     lazy = false,
    --     priority = 1000,
    --     config = function()
    --         require("kanagawa").setup({
    --             keywordStyle = { italic = false },
    --             Italic = { italic = false },
    --             -- Remove sign column background
    --             colors = {
    --                 theme = {
    --                     all = {
    --                         ui = { bg_gutter = "none" }
    --                     }
    --                 }
    --             },
    --             overrides = function(colors)
    --                 local theme = colors.theme
    --                 return {
    --                     -- make completions menu background darker
    --                     Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
    --                     PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
    --                     PmenuSbar = { bg = theme.ui.bg_m1 },
    --                     PmenuThumb = { bg = theme.ui.bg_p2 },
    --                 }
    --             end,
    --         })
    --         vim.cmd("colorscheme kanagawa-wave")
    --     end
    -- },
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = function()
            require("gruvbox").setup({
                terminal_colors = true, -- add neovim terminal colors
                undercurl = true,
                underline = true,
                bold = false,
                italic = {
                    strings = false,
                    emphasis = false,
                    comments = true,
                    operators = false,
                    folds = false,
                },
                strikethrough = true,
                invert_selection = false,
                invert_signs = false,
                invert_tabline = false,
                invert_intend_guides = false,
                inverse = true, -- invert background for search, diffs, statuslines and errors
                contrast = "",  -- can be "hard", "soft" or empty string
                palette_overrides = {},
                overrides = {
                    SignColumn = { bg = "#282828" } -- same as editor background
                },
                dim_inactive = false,
                transparent_mode = false,
            })
            vim.cmd("colorscheme gruvbox")
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
