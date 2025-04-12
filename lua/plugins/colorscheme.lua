return {
    "navarasu/onedark.nvim",
    priority = 1000,
    config = function()
        require("onedark").setup({
            style = "warmer",
            colors = { bg0 = "#282828" }, -- Override default colors
            diagnostics = {
                darker = false
            },
            highlights = {
                TelescopeBorder = { fg = "#35373b" },
                TelescopePromptBorder = { fg = "#35373b" },
                TelescopeResultsBorder = { fg = "#35373b" },
                TelescopePreviewBorder = { fg = "#35373b" },
                TelescopeResultsTitle = { fg = "#99bc80" },
                TelescopePreviewTitle = { fg = "#99bc80" },
                TelescopeTitle = { fg = "#99bc80" },

                ModeMsg = { fg = "#abb2bf" },

                NvimTreeNormal = { bg = "#282828" }, -- Main background
                NvimTreeRootFolder = { bg = "#282828" },
                NvimTreeFolderIcon = { bg = "#282828" },
                NvimTreeFileIcon = { bg = "#282828" },
                NvimTreeEmpty = { bg = "#282828" },
                NvimTreeIndentMarker = { bg = "#282828" },
                NvimTreeEndOfBuffer = { bg = "#282828", fg = "#282828" },
            }
        })
        vim.cmd("colorscheme onedark")
    end
}
