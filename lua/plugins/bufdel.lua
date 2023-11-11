require("bufdel").setup({
	quit = false,
})

MapN("<C-w>", function()
	vim.cmd("BufDel")

	if vim.api.nvim_buf_line_count(0) < 2 then
		vim.cmd("NvimTreeFindFileToggle")
		vim.cmd("NvimTreeFindFileToggle")
	end
end)
