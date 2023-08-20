local custom_onedark = require ("lualine.themes.onedark")

custom_onedark.normal.a.bg = "#98C379"
custom_onedark.insert.a.bg = "#61AFEF"
custom_onedark.visual.a.bg = "#C678DD"
custom_onedark.command = {
    a = {
        gui = "bold",
        bg = "#E5C07B",
        fg = "#282C34"
    }
}

require("lualine").setup({
    options = {
        theme = custom_onedark
    }
})
