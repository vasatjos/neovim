return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        -- disable netrw
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        require("nvim-tree").setup({
            view = {
                width = 45,
                relativenumber = true
            },
        })
        vim.keymap.set("n", "<leader>rw", ":NvimTreeToggle<CR>")
    end,
}
