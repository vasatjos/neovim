vim.g.mapleader = " "

local keymap = vim.keymap

-- keymap.set("n", "<leader>rw", vim.cmd.Ex) -- open Netrw

keymap.set("n", "x", '"_x')                 -- don't copy deleted characters

keymap.set("n", "<leader>sv", "<C-w>v")     -- vertical split
keymap.set("n", "<leader>sh", "<C-w>s")     -- horizontal split
keymap.set("n", "<leader>se", "<C-w>=")     -- set width equal
keymap.set("n", "<leader>sx", ":close<CR>") -- close

keymap.set("n", "<leader>ch", ":nohl<CR>")  -- clear highlights

keymap.set("n", "<leader><leader>+", "<C-a>")
keymap.set("n", "<leader><leader>-", "<C-x>")

keymap.set("i", "<C-h>", "<Left>")
keymap.set("i", "<C-j>", "<Down>")
keymap.set("i", "<C-k>", "<Up>")
keymap.set("i", "<C-l>", "<Right>")
keymap.set("i", "<C-w>", "<C-o>w")
keymap.set("i", "<C-b>", "<C-o>b")

keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

keymap.set("n", "J", "mzJ`z")
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")
keymap.set("x", "<leader>p", [["_dP]])       -- paste over without replacing clipboard
keymap.set({"n", "v"}, "<leader>y", [["+y]]) -- system clipboard
keymap.set("n", "<leader>Y", [["+Y]])        -- system clipboard
keymap.set({ "n", "v" }, "<leader>d", [["_d]])
keymap.set("n", "Q", "<nop>")
keymap.set("n", "<leader>fd", vim.lsp.buf.format)



-- plugin keymaps
keymap.set("n", "<leader>rw", vim.cmd.NvimTreeToggle)
keymap.set("n", "<leader>ds", require("telescope.builtin").lsp_document_symbols) -- [D]ocument [S]ymbols
keymap.set("n", "<leader>fr", require("telescope.builtin").lsp_references)
