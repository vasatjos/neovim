return {
    "navarasu/onedark.nvim",
    priority = 1000,
    config = function()
        require("onedark").setup({
            style = "warm",
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
            }
        })
        vim.cmd("colorscheme onedark")
    end
}
