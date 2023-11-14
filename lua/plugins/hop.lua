return function()
	require("hop").setup()

	local fix_highlight = function()
		vim.api.nvim_set_hl(0, "HopNextKey", vim.api.nvim_get_hl_by_name("Question", true))
		vim.api.nvim_set_hl(0, "HopNextKey1", vim.api.nvim_get_hl_by_name("Title", true))
		vim.api.nvim_set_hl(0, "HopNextKey2", vim.api.nvim_get_hl_by_name("Title", true))
	end

	vim.api.nvim_create_autocmd("ColorScheme", { callback = fix_highlight })
	fix_highlight()

	SetupKeymap("n", "f", "<cmd>HopWord<CR>")
end
