return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    -- or                              , branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>ff", builtin.find_files, {}) -- find file
        vim.keymap.set("n", "<leader>fw", function()              -- find word
            builtin.grep_string({ search = vim.fn.input ("Find word: ") })
        end)
        vim.keymap.set("n", "<leader>lg", builtin.live_grep, {})
        vim.keymap.set("n", "<leader>ds", builtin.lsp_document_symbols) -- [D]ocument [S]ymbols
        vim.keymap.set("n", "<leader>fr", builtin.lsp_references)
    end,
}
