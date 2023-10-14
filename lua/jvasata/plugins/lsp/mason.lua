-- import mason plugin safely
local mason_status, mason = pcall(require, "mason")
if not mason_status then
  return
end

-- import mason-lspconfig plugin safely
local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
  return
end

local lsp = require("lsp-zero")

mason.setup()

mason_lspconfig.setup({
    ensure_installed = {
        "clangd",
        "cmake",
    },
    handlers = {
        lsp.default_setup,
    },
})
