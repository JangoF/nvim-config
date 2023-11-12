require("telescope").setup({

	pickers = {
		colorscheme = {
			theme = "dropdown",
		},
	},

	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		},
	},
})

require("telescope").load_extension("fzf")

MapN("<C-j>", "<cmd>wincmd j<CR>")
MapN("<leader>lg", "<cmd>Telescope live_grep<CR>")
MapN("<leader>cs", "<cmd>Telescope colorscheme<CR>")
MapN("<leader>fl", "<cmd>Telescope find_files<CR>")
