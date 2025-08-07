vim.g.mapleader = " "

local map = vim.keymap.set

map("n", "x", '"_x') -- don't copy deleted characters
map("n", "s", '"_s')

map("n", "<leader>sv", "<C-w>v")     -- vertical split
map("n", "<leader>sh", "<C-w>s")     -- horizontal split
map("n", "<leader>se", "<C-w>=")     -- set width equal
map("n", "<leader>sx", ":close<CR>") -- close

map("n", "<Esc>", ":nohl<CR>")       -- clear highlights

map("i", "<C-h>", "<Left>")
map("i", "<C-j>", "<Down>")
map("i", "<C-k>", "<Up>")
map("i", "<C-l>", "<Right>")
map("i", "<C-w>", "<C-o>w")
map("i", "<C-b>", "<C-o>b")

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map("v", ">", ">gv")
map("v", "<", "<gv")

map("n", "yA", "ggVGy")                       -- yank all
map("n", "<leader>yA", 'ggVG"+y')             -- yank all to system clipboard
map({ "n", "v" }, "<leader><leader>p", '"+p') -- paste from system clipboard

map("n", "<Up>", vim.cmd.cprev)
map("n", "<Down>", vim.cmd.cnext)

map("n", "<leader><S-Tab>", vim.cmd.tabprev)
map("n", "<leader><Tab>", vim.cmd.tabnext)

map("n", "J", "mzJ`z")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map({ "v", "x" }, "<leader>p", [["_dP]]) -- paste over without replacing clipboard
map({ "n", "v" }, "<leader>y", [["+y]])  -- system clipboard
map("n", "<leader>Y", [["+Y]])           -- system clipboard
map({ "n", "v", "x" }, "<leader>d", [["_d]])
map({ "n", "v", "x" }, "<leader>c", [["_c]])
map("n", "Q", "<nop>")

vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    callback = function()
        map("n", "<leader>ti", "A  # type: ignore<Esc>", { buffer = true, desc = "Append # type: ignore" })
    end,
})
