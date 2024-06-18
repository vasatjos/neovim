vim.g.mapleader = " "

local map = vim.keymap.set

-- keymap.set("n", "<leader>rw", vim.cmd.Ex) -- open Netrw, uncomment if not using a different file browser

map("n", "x", '"_x')                 -- don't copy deleted characters

map("n", "<leader>sv", "<C-w>v")     -- vertical split
map("n", "<leader>sh", "<C-w>s")     -- horizontal split
map("n", "<leader>se", "<C-w>=")     -- set width equal
map("n", "<leader>sx", ":close<CR>") -- close

map("n", "<Esc>", ":nohl<CR>")  -- clear highlights

map("i", "<C-h>", "<Left>")
map("i", "<C-j>", "<Down>")
map("i", "<C-k>", "<Up>")
map("i", "<C-l>", "<Right>")
map("i", "<C-w>", "<C-o>w")
map("i", "<C-b>", "<C-o>b")

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map("n", "yA", "ggVGy")              -- yank all
map("n", "<leader>yA", 'ggVG"+y')    -- yank all to system clipboard

map("n", "<Up>", vim.cmd.cprev)
map("n", "<Down>", vim.cmd.cnext)

map("n", "J", "mzJ`z")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("x", "<leader>p", [["_dP]])       -- paste over without replacing clipboard
map({ "n", "v" }, "<leader>y", [["+y]]) -- system clipboard
map("n", "<leader>Y", [["+Y]])        -- system clipboard
map({ "n", "v" }, "<leader>d", [["_d]])
map("n", "Q", "<nop>")
