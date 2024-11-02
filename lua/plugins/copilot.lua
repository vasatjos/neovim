return {
    {
        "github/copilot.vim",
        event = "VeryLazy",
        config = function()
            vim.g.copilot_no_tab_map = true
            vim.g.copilot_enabled = false
            vim.keymap.set('i', '<S-Right>', 'copilot#Accept("\\<CR>")', {
                expr = true,
                replace_keycodes = false
            })
            vim.keymap.set('i', '<M-y>', 'copilot#Accept("\\<CR>")', {
                expr = true,
                replace_keycodes = false
            })
            vim.keymap.set('i', '<M-w>', '<Plug>(copilot-accept-word)')
            vim.keymap.set('i', '<M-l>', '<Plug>(copilot-accept-line)')
            vim.keymap.set('i', '<M-Right>', '<Plug>(copilot-next)')
            vim.keymap.set('i', '<M-Left>', '<Plug>(copilot-prev)')
            vim.keymap.set('i', '<M-e>', 'copilot#Dismiss()', {
                expr = true,
                silent = true
            })
        end
    }
}
