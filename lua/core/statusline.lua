-- https://shapeshed.com/vim-statuslines/

local function lsp_diagnostics()
    local diagnostics = vim.diagnostic.get(0)
    local error_count = 0
    local warning_count = 0
    local info_count = 0
    local hint_count = 0

    for _, diagnostic in ipairs(diagnostics) do
        if diagnostic.severity == vim.diagnostic.severity.ERROR then
            error_count = error_count + 1
        elseif diagnostic.severity == vim.diagnostic.severity.WARN then
            warning_count = warning_count + 1
        elseif diagnostic.severity == vim.diagnostic.severity.INFO then
            info_count = info_count + 1
        elseif diagnostic.severity == vim.diagnostic.severity.HINT then
            hint_count = hint_count + 1
        end
    end

    local result = ""
    if error_count > 0 then
        result = result .. "%#DiagnosticError# E:" .. error_count .. " "
    end
    if warning_count > 0 then
        result = result .. "%#DiagnosticWarn# W:" .. warning_count .. " "
    end
    if info_count > 0 then
        result = result .. "%#DiagnosticInfo# I:" .. info_count .. " "
    end
    if hint_count > 0 then
        result = result .. "%#DiagnosticHint# H:" .. hint_count .. " "
    end
    return result
end

local function statusline()
    local lsp_status = lsp_diagnostics()
    local reset_color = "%*" -- default color
    local file_name = " %f"
    local modified = "%m"
    local align_right = "%="
    local filetype = " %y"
    local percentage = " %p%%"
    local linecol = " %l:%c"

    return string.format(
        "%s %s%s %s%s %s %s %s ",

        file_name,

        modified,
        lsp_status,

        reset_color,
        align_right,

        filetype,

        percentage,

        linecol
    )
end

vim.opt.laststatus = 3
vim.opt.statusline = statusline()

-- Update statusline on diagnostic changes
vim.api.nvim_create_autocmd({ "DiagnosticChanged", "LspAttach", "BufEnter", "BufWinEnter", "BufDelete" }, {
    callback = function()
        vim.opt.statusline = statusline()
        vim.cmd("redrawstatus")
    end
})

local timer = vim.loop.new_timer()
timer:start(2000, 2000, vim.schedule_wrap(function()
    vim.opt.statusline = statusline()
    vim.cmd("redrawstatus")
end))
