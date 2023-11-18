return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = "BufAdd",
	config = function()
		require("nvim-treesitter.configs").setup({
			auto_install = true,

			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},

			indent = {
				enable = true,
			},
		})
	end,
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",

		config = function()
			require("nvim-treesitter.configs").setup({
				textobjects = {
					select = {
						enable = true,
					lookahead = true,
						keymaps = {
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
						},
						include_surrounding_whitespace = false,
					},
				},
			})
		end,
	},
}
