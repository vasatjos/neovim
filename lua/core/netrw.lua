vim.keymap.set("n", "<leader>rw", vim.cmd.Lex)

-- Set the banner to be off
vim.g.netrw_banner = 0

-- Netrw list style
-- 0 : file per line
-- 1 : file per line with timestamp information and file size
-- 2 : multiple files in columns
-- 3 : tree style listing
vim.g.netrw_liststyle = 3

-- Set window width
vim.g.netrw_winsize = 25

-- Directories first
vim.g.netrw_sort_sequence = [[[\/]$,*]]

-- Enable recursive copy of directories
vim.g.netrw_localcopydircmd = "cp -r"

-- Enable recursive creation of directories
vim.g.netrw_localmkdir = "mkdir -p"

-- Enable recursive removal of directories
vim.g.netrw_localrmdir = "rm -r"
