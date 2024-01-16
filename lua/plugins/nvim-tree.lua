-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    },
    config = function()
        require("nvim-tree").setup({
            renderer = {
                icons = {
                    glyphs = {
                        folder = {
                            arrow_closed = "", -- arrow when folder is closed
                            arrow_open = "", -- arrow when folder is open
                        },
                    },
                },
            },
            actions = {
                open_file = {
                    window_picker = {
                        enable = false,
                    },
                },
            },
            git = {
                ignore = false,
            },
            view = {
                width = 40,
            },
        })
        vim.keymap.set("n", "<leader>rw", vim.cmd.NvimTreeToggle)
    end
}
