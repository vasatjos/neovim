return {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
        require("ibl").setup({
            scope = {
                -- don't highlight start of indent block nor return
                show_start = false,
                show_end = false,
            }
        })
    end
}
