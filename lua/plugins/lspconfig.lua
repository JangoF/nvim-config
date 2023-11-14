return function()
	local lspconfig = require("lspconfig")
  local lsp_defaults = lspconfig.util.default_config

	lsp_defaults.capabilities =
		vim.tbl_deep_extend("force", lsp_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities())

	lspconfig.tsserver.setup({})

	lspconfig.lua_ls.setup({
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
			},
		},
	})

	vim.diagnostic.config({
		virtual_text = true,
		signs = true,
		update_in_insert = false,
		underline = true,
		severity_sort = true,
		float = true,
	})

	local signs = {
		Error = " ",
		Warn = " ",
		Hint = "󱤅 ",
		Info = " ",
	}

	for type, icon in pairs(signs) do
		local group = "DiagnosticSign" .. type
		vim.fn.sign_define(group, { text = icon, texthl = group, numhl = group })
	end

	SetupKeymap("n", "<leader>of", "<cmd>lua vim.diagnostic.open_float()<CR>")
	SetupKeymap("n", "<leader>j", "<cmd>lua vim.diagnostic.goto_next({ float = false })<CR>")
	SetupKeymap("n", "<leader>k", "<cmd>lua vim.diagnostic.goto_prev({ float = false })<CR>")
end
