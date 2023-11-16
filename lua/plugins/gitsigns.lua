return {
	"lewis6991/gitsigns.nvim",
	event = "BufAdd",

	config = function()
		require("gitsigns").setup({
			signcolumn = false,
			numhl = true,
			linehl = false,
			word_diff = false,
		})
	end,
}
