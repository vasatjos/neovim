-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd([[ highlight NvimTreeIndentMarker guifg=#F08080 ]])

-- empty setup using defaults
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
