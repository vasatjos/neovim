return {
        "navarasu/onedark.nvim",
        priority = 1000,
        config = function()
            require("onedark").setup({
                style = "warm",
                colors = { bg0 = "#282828" }, -- Override default colors
            })
            vim.cmd("colorscheme onedark")
        end
    }
