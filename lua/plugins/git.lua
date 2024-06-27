return {
    {
        "tpope/vim-fugitive",
        config = function()
            vim.keymap.set("n", "<leader>gd", "<cmd>Gvdiffsplit!<CR>", {}) -- TODO: Fix null-ls errors
            vim.keymap.set("n", "<leader>gh", "<cmd>diffget //2<CR>")
            vim.keymap.set("n", "<leader>gl", "<cmd>diffget //3<CR>")
        end,
    },
    {
        "lewis6991/gitsigns.nvim",
        config = true
    },
}
