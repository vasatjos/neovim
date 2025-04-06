return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local todo = require("todo-comments")
        todo.setup({
            signs = false,
            highlight = {
                keyword = "bg",
                after = ""
            },
        })

        vim.keymap.set("n", "]t", function()
            todo.jump_next()
        end, { desc = "Next todo comment" })

        vim.keymap.set("n", "[t", function()
            todo.jump_prev()
        end, { desc = "Previous todo comment" })

        vim.keymap.set("n", "<leader>ft", function()
            vim.cmd("TodoTelescope")
        end, {})
    end
}
