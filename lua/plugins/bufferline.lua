return function()
	require("bufferline").setup({
		options = {
			show_buffer_close_icons = false,
			separator_style = "thick",
			numbers = "ordinal",
			offsets = {
				{
					filetype = "NvimTree",
					text = "File Explorer",
					highlight = "BufferLineTab",
					text_align = "center",
					separator = true,
				},
			},
		},
	})

	SetupKeymap("n", "1", "<cmd>BufferLineGoToBuffer 1<CR>")
	SetupKeymap("n", "2", "<cmd>BufferLineGoToBuffer 2<CR>")
	SetupKeymap("n", "3", "<cmd>BufferLineGoToBuffer 3<CR>")
	SetupKeymap("n", "4", "<cmd>BufferLineGoToBuffer 4<CR>")
	SetupKeymap("n", "5", "<cmd>BufferLineGoToBuffer 5<CR>")
	SetupKeymap("n", "6", "<cmd>BufferLineGoToBuffer 6<CR>")
	SetupKeymap("n", "7", "<cmd>BufferLineGoToBuffer 7<CR>")
	SetupKeymap("n", "8", "<cmd>BufferLineGoToBuffer 8<CR>")
	SetupKeymap("n", "9", "<cmd>BufferLineGoToBuffer 9<CR>")

	SetupKeymap("n", "<S-h>", "cmd>BufferLineCyclePrev<CR>")
	SetupKeymap("n", "<S-l>", "cmd>BufferLineCycleNext<CR>")
end
