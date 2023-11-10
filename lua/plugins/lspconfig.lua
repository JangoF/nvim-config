local lspconfig = require('lspconfig')
-- local lsp_defaults = lspconfig.util.default_config

-- Define LSP capabilities:
-- lsp_defaults.capabilities = vim.tbl_deep_extend(
--   'force',
--   lsp_defaults.capabilities,
--   require('cmp_nvim_lsp').default_capabilities()
-- )

-- require("mason").setup()
-- require("mason-lspconfig").setup()
-- Setup LSP:
--lspconfig.gdscript.setup({})
--lspconfig.rnix.setup({})
--lspconfig.tsserver.setup({})
-- lspconfig.csharp_ls.setup({})
--
-- lspconfig.omnisharp.setup({})
-- local pid = vim.fn.getpid()
-- local omnisharp_bin = "/home/jango/.local/omnisharp/run";
-- lspconfig.omnisharp.setup({
--     cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) };
-- })
-- lspconfig.lua_ls.setup({
--   settings = {
--     Lua = {
--       diagnostics = {
--         globals = { 'vim' },
--       },
--     },
--   },
-- })

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  float = true,
})

-- Setup Appearance:
local signs = {
  Error = ' ',
  Warn = ' ',
  Hint = ' ',
  Info = ' '
}

for type, icon in pairs(signs) do
  local group = 'DiagnosticSign' .. type
  vim.fn.sign_define(group, { text = icon, texthl = group, numhl = group })
end

-- Setup Keysmap;
MapN('<leader>of', '<cmd>lua vim.diagnostic.open_float()<CR>')
MapN('<leader>j', '<cmd>lua vim.diagnostic.goto_next({ float = false })<CR>')
MapN('<leader>k', '<cmd>lua vim.diagnostic.goto_prev({ float = false })<CR>')
