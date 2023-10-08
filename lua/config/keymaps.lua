-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Require the which-key plugin
local wk = require("which-key")

-- Add your mappings
wk.register({
  ["<leader>D"] = {
    name = "Database",
    u = { ":DBUIToggle<CR>", "Open/Close Dadbod UI" },
    a = { ":DBUIAddConnection<CR>", "Add a DB Connection" },
  },
  ["<leader>c"] = {
    name = "Code",
    a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action" },
    d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Go to Definition" },
    f = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "Format Code" },
    r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename Symbol" },
  },
}, { mode = "n" })
