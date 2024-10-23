return {
    'mfussenegger/nvim-jdtls',
    dependencies = 'hrsh7th/cmp-nvim-lsp',
    config = function()
        -- Ensure the file is a valid Java file and exists before attaching JDTLS
        local filetype = vim.bo.filetype
        local bufname = vim.api.nvim_buf_get_name(0)

        if filetype == 'java' and bufname ~= '' and vim.fn.filereadable(bufname) == 1 then
            require 'jdtls'.start_or_attach({
                cmd = {
                    -- Path to the JDTLS launcher script from Mason
                    vim.fn.expand('$HOME/.local/share/nvim/mason/bin/jdtls'),
                    -- Add Lombok support with the proper --jvm-arg
                    ('--jvm-arg=-javaagent:%s'):format(vim.fn.expand('$HOME/.local/share/nvim/mason/packages/jdtls/lombok.jar'))
                },
                -- Pass default LSP capabilities for cmp-nvim-lsp integration
                capabilities = require 'cmp_nvim_lsp'.default_capabilities(),
                -- Root directory setup (optional)
                root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'})
            })
        end
    end
}
