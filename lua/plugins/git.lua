return {
    {
        "tpope/vim-fugitive",
        event = "VeryLazy",
        config = function()
            -- Helper function to automatically select and resolve conflict by whole blocks
            -- instead of having to manually select the lines
            local function smart_diffget(target)
                local current_line = vim.api.nvim_win_get_cursor(0)[1]

                -- Search backwards for the start marker and forwards for the end marker
                local start_line = vim.fn.search("^<<<<<<<", "bcnW")
                local end_line = vim.fn.search("^>>>>>>>", "cnW")

                if start_line > 0 and end_line > 0 and current_line >= start_line and current_line <= end_line then
                    -- Construct and run a range command (e.g., ":45,54diffget //2")
                    vim.cmd(start_line .. "," .. end_line .. "diffget " .. target)
                else
                    vim.cmd("diffget " .. target) -- Fallback for standard, marker-less diff hunks
                end

                vim.cmd("diffupdate") -- Clear highlight artifacts
            end

            vim.keymap.set("n", "<leader>gmd", "<cmd>Gvdiffsplit!<CR>", { desc = "Fugitive 3-way merge" })

            vim.keymap.set("n", "<leader>gh", function() smart_diffget("//2") end, { desc = "Smart diffget from left" })
            vim.keymap.set("n", "<leader>gl", function() smart_diffget("//3") end, { desc = "Smart diffget from right" })

            -- Retain manual selection capability if necessary
            vim.keymap.set("v", "<leader>gh", ":diffget //2<CR>:diffupdate<CR>",
                { desc = "Diffget from left (selection)" })
            vim.keymap.set("v", "<leader>gl", ":diffget //3<CR>:diffupdate<CR>",
                { desc = "Diffget from right (selection)" })
        end,
    },
    {
        "lewis6991/gitsigns.nvim",
        config = true
    },
}
