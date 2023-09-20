local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {}) -- find file
vim.keymap.set("n", "<leader>fw", function()              -- find word
        builtin.grep_string({ search = vim.fn.input ("Find word: ") })
    end)
vim.keymap.set("n", "<leader>lg", builtin.live_grep, {})
