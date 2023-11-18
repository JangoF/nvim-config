return function()
	vim.g.loaded_netrw = 1
	vim.g.loaded_netrwPlugin = 1

	local api = require("nvim-tree.api")

	local function on_attach(bufnr)
		SetupKeymap("n", "h", api.node.navigate.parent_close, { buffer = bufnr, noremap = true, nowait = true })
		SetupKeymap("n", "l", api.node.open.edit, { buffer = bufnr, noremap = true, nowait = true })
		SetupKeymap("n", "a", api.fs.create, { buffer = bufnr, noremap = true, nowait = true })
		SetupKeymap("n", "d", api.fs.remove, { buffer = bufnr, noremap = true, nowait = true })
		SetupKeymap("n", "r", api.fs.rename_sub, { buffer = bufnr, noremap = true, nowait = true })
	end

	require("nvim-tree").setup({
		on_attach = on_attach,
		hijack_unnamed_buffer_when_opening = true,
		sync_root_with_cwd = true,

		renderer = {
			root_folder_label = false,
			highlight_git = true,

			icons = {
				git_placement = "after",
			},

			indent_markers = {
				enable = true,
				inline_arrows = true,
				icons = {
					corner = "└",
					edge = "│",
					item = "│",
					bottom = "─",
					none = " ",
				},
			},
		},

		view = {
			width = 40,
		},
	})

	vim.api.nvim_create_autocmd({ "VimEnter" }, {
		callback = function()
			require("nvim-tree.api").tree.open()
		end,
	})
end
