return {
    {
        "olimorris/onedarkpro.nvim",
        priority = 1000, -- Ensure it loads first
        config = function()
            local onedark = require("onedarkpro")
            onedark.setup({
                options = {
                    cursorline = true
                },
            })
            vim.cmd("colorscheme onedark")
        end,
    },
    "christoomey/vim-tmux-navigator", -- Ctrl + motions to change split focus
    "tpope/vim-surround",
    {
        "numToStr/Comment.nvim",
        config = true
    }
}
