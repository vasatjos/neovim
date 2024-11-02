return {
    {
        "tpope/vim-fugitive",
        event = "VeryLazy",
        config = function()
            vim.keymap.set("n", "<leader>gd", "<cmd>Gvdiffsplit!<CR>", {})
            vim.keymap.set("n", "<leader>gh", "<cmd>diffget //2<CR>")
            vim.keymap.set("n", "<leader>gl", "<cmd>diffget //3<CR>")
        end,
    },
    {
        "lewis6991/gitsigns.nvim",
        config = true
    },
}
