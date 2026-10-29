return {
    "OXY2DEV/markview.nvim",
    lazy = false,
    config = function()
        require("markview").setup({
            preview = {
                filetypes = { "markdown", "quarto", "rmd", "asciidoc" },
            },
            typst = {
                enable = false,
            },
        })
    end
}
