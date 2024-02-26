return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui"
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

        -- Add other languages here
    end,
}
