return function()
	require("hop").setup()

	local fix_highlight = function()
    vim.api.nvim_set_hl(0, "HopNextKey", vim.api.nvim_get_hl(0, { name = "DevIconSml" }))
    vim.api.nvim_set_hl(0, "HopNextKey1", vim.api.nvim_get_hl(0, { name = "Title" }))
    vim.api.nvim_set_hl(0, "HopNextKey2", vim.api.nvim_get_hl(0, { name = "Title" }))
	end

	vim.api.nvim_create_autocmd("ColorScheme", { callback = fix_highlight })
	fix_highlight()
end
