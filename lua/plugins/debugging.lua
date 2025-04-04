return {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
    },
    config = function()
        local dap, dapui = require("dap"), require("dapui")
        dapui.setup()
        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end
        vim.keymap.set("n", "<leader>vdb", dap.toggle_breakpoint, {})
        vim.keymap.set("n", "<leader>vdc", dap.continue, {})
        vim.keymap.set("n", "<leader>vdt", dapui.toggle, {})
        vim.keymap.set("n", "<leader>vdk", dap.terminate, {}) -- Kill

        -- C/C++ debugging
        dap.adapters.gdb = {
            type = "executable",
            command = "gdb",
            args = { "-i", "dap" }
        }
        local c_config = {
            {
                name = "Launch",
                type = "gdb",
                request = "launch",
                program = function()
                    local current_dir = vim.fn.getcwd() .. "/"
                    local file = vim.fn.input('Path to executable: ', current_dir, 'file')
                    if file == current_dir then
                        return current_dir .. "a.out"
                    else
                        return file
                    end
                end,
                cwd = "${workspaceFolder}",
                stopAtBeginningOfMainSubprogram = false,
            },
        }
        dap.configurations.c = c_config
        dap.configurations.cpp = c_config

        dap.adapters.python = function(cb, config)
            if config.request == 'attach' then
                ---@diagnostic disable-next-line: undefined-field
                local port = (config.connect or config).port
                ---@diagnostic disable-next-line: undefined-field
                local host = (config.connect or config).host or '127.0.0.1'
                cb({
                    type = 'server',
                    port = assert(port, '`connect.port` is required for a python `attach` configuration'),
                    host = host,
                    options = {
                        source_filetype = 'python',
                    },
                })
            else
                cb({
                    type = 'executable',
                    command = 'python3',
                    args = { '-m', 'debugpy.adapter' },
                    options = {
                        source_filetype = 'python',
                    },
                })
            end
        end
        dap.configurations.python = {
            {
                -- The first three options are required by nvim-dap
                type = 'python', -- the type here established the link to the adapter definition: `dap.adapters.python`
                request = 'launch',
                name = "Launch file",
                -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options
                program = "${file}",                   -- this configuration will launch the current file if used
                pythonPath = vim.fn.exepath('python3') -- assumes potential virtualenv is activated already
            },
        }
    end,
}
