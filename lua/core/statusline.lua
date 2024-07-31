local function git_branch()
    local branch = vim.fn.system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
    if string.len(branch) > 0 then
        return branch
    else
        return ""
    end
end

local function statusline()
    local set_color_1 = "%#PmenuSel#"
    local branch = git_branch()
    local set_color_2 = "%*" -- default color
    local file_name = " %f"
    local modified = "%m"
    local align_right = "%="
    local filetype = " %y"
    local percentage = " %p%%"
    local linecol = " %l:%c"

    return string.format(
        "%s %s %s%s %s%s%s %s %s ",
        set_color_1,
        branch,  -- spaces around the branch name
        set_color_2,
        file_name,
        modified, -- space before the modified flag
        align_right,
        filetype,
        percentage,
        linecol -- space around the line:column
    )
end

vim.opt.statusline = statusline()
