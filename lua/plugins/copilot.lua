return {
    {
        "github/copilot.vim",
        config = function()
            vim.keymap.set('i', '<S-Right>', 'copilot#Accept("\\<CR>")', {
                expr = true,
                replace_keycodes = false
            })
            vim.keymap.set('i', '<M-y>', 'copilot#Accept("\\<CR>")', {
                expr = true,
                replace_keycodes = false
            })
            vim.g.copilot_no_tab_map = true
            vim.keymap.set('i', '<M-w>', '<Plug>(copilot-accept-word)')
            vim.keymap.set('i', '<M-l>', '<Plug>(copilot-accept-line)')
            vim.keymap.set('i', '<M-Right>', '<Plug>(copilot-next)')
            vim.keymap.set('i', '<M-Left>', '<Plug>(copilot-prev)')
        end
    }
}
