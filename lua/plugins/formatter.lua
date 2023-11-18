return function()
	require("formatter").setup({
		logging = true,
		log_level = vim.log.levels.WARN,

		filetype = {
			lua = {
				require("formatter.filetypes.lua").stylua,
			},

			javascript = {
				function()
					return {
						exe = "prettierd",
						args = { vim.api.nvim_buf_get_name(0) },
						stdin = true,
					}
				end,
			},
		},
	})

	SetupKeymap("n", "<leader>fa", "<cmd>Format<CR>")
end
