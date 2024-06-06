return {
    "nvim-lualine/lualine.nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
    },
    config = function()
        require("lualine").setup({
            options = {
                theme = 'auto',
                globalstatus = true,
            },
            sections = {
                lualine_x = { 'filetype' },     -- remove encoding and fileformat
            },
        })
    end,

}
