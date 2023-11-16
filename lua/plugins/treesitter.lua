return function()
	require("nvim-treesitter.configs").setup({
		auto_install = true,

		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},

    -- incremental_selection = { enable = true },
    textobjects = { enable = true },

		indent = {
			enable = true,
		},
	})
end
