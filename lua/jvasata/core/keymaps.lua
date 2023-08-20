vim.g.mapleader = " "

local keymap = vim.keymap

-- keymap.set("n", "<leader>rw", vim.cmd.Ex) -- open Netrw

keymap.set("n", "x", '"_x') -- don't copy deleted characters

keymap.set ("n", "<leader>sv", "<C-w>v")        -- vertical split
keymap.set ("n", "<leader>sh", "<C-w>s")        -- horizontal split
keymap.set ("n", "<leader>se", "<C-w>=")        -- set width equal
keymap.set ("n", "<leader>sx", ":close<CR>")    -- close

keymap.set("i", "<C-h>", "<C-o>h")
keymap.set("i", "<C-j>", "<C-o>j")
keymap.set("i", "<C-k>", "<C-o>k")
keymap.set("i", "<C-l>", "<C-o>l")
keymap.set("i", "<C-w>", "<C-o>w")
keymap.set("i", "<C-b>", "<C-o>b")

-- plugin keymaps
keymap.set ("n", "<leader>rw", vim.cmd.NvimTreeToggle)
