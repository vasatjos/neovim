require("core.statusline")

local opt = vim.opt

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-- line wrap
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true

opt.cursorline = true

opt.swapfile = false
opt.updatetime = 50

opt.scrolloff = 8
opt.sidescrolloff = 10

--appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.colorcolumn = "80"

opt.backspace = "indent,eol,start"

-- use system clipboard
--opt.clipboard = "unnamedplus"

-- split windows
opt.splitright = true
opt.splitbelow = true

-- suppress certain warnings
local notify = vim.notify
vim.notify = function(msg, ...)
    -- LSP floating docs warning
    if msg:match("warning: multiple different client offset_encodings") then
        return
    end
    -- Git diff split warning
    if msg:match("^%[null%-ls%] failed to run generator:") then
        return
    end
    -- LSP telescope nvim 0.11 warnings
    if msg:match("position_encoding param is required in vim.lsp.util.make_position_params. Defaulting to position encoding of the first client.") then
        return
    end


    notify(msg, ...)
end

-- Highlight when yanking (copying) text
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- Turn off expandtab for Makefiles
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'make',
    callback = function()
        vim.opt_local.expandtab = false
    end,
})
