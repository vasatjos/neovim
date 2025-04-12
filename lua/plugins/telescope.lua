return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    -- or                              , branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>ff", builtin.find_files, {})       -- find file
        vim.keymap.set("n", "<leader>fw", builtin.live_grep, {})        -- find word
        vim.keymap.set("n", "<leader>ds", builtin.lsp_document_symbols) -- [D]ocument [S]ymbols
        vim.keymap.set("n", "<leader>fr", builtin.lsp_references)
        vim.keymap.set("n", "<leader>fh", function()
            builtin.find_files({
                hidden = true,
                find_command = { 'fd', '--type', 'f', '--hidden', '--exclude', '.git' },
            })
        end)
        vim.keymap.set("n", "<leader>fg", builtin.git_files)
    end,
}
