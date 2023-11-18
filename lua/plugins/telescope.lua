return function()
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
end
