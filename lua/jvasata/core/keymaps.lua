vim.g.mapleader = " "

local keymap = vim.keymap

-- keymap.set("n", "<leader>rw", vim.cmd.Ex) -- open Netrw

keymap.set("n", "x", '"_x')                 -- don't copy deleted characters

keymap.set("n", "<leader>sv", "<C-w>v")     -- vertical split
keymap.set("n", "<leader>sh", "<C-w>s")     -- horizontal split
keymap.set("n", "<leader>se", "<C-w>=")     -- set width equal
keymap.set("n", "<leader>sx", ":close<CR>") -- close

keymap.set("i", "<C-h>", "<C-o>h")
keymap.set("i", "<C-j>", "<C-o>j")
keymap.set("i", "<C-k>", "<C-o>k")
keymap.set("i", "<C-l>", "<C-o>l")
keymap.set("i", "<C-w>", "<C-o>w")
keymap.set("i", "<C-b>", "<C-o>b")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("x", "<leader>p", [["_dP]]) -- paste over without replacing clipboard
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>fd", vim.lsp.buf.format)



-- plugin keymaps
keymap.set("n", "<leader>rw", vim.cmd.NvimTreeToggle)
