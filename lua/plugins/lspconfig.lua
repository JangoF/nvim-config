return function()
	local lspconfig = require("lspconfig")

	lspconfig.tsserver.setup({})

	require("lspconfig").lua_ls.setup({
		on_init = function(client)
			local path = client.workspace_folders[1].name

			if not vim.loop.fs_stat(path .. "/.luarc.json") and not vim.loop.fs_stat(path .. "/.luarc.jsonc") then
				client.config.settings = vim.tbl_deep_extend("force", client.config.settings, {
					Lua = {
						runtime = {
							version = "LuaJIT",
						},

						workspace = {
							checkThirdParty = false,
							library = {
								vim.env.VIMRUNTIME,
							},
						},
					},
				})

				client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
			end
			return true
		end,
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
