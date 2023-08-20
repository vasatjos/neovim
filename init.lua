vim.g.mapleader = " "
require("jvasata.lazy")
require("lazy").setup("plugins")
require("jvasata.core.options")
require("jvasata.core.keymaps")
require("jvasata.core.colorscheme")
require("jvasata.plugins.telescope")
require("jvasata.plugins.nvim-tree")
require("jvasata.plugins.lualine")
require("jvasata.plugins.nvim-cmp")
require("jvasata.plugins.lsp.mason")
require("jvasata.plugins.lsp.lspconfig")

