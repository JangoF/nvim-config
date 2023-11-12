require("nvim-treesitter.configs").setup({
	ensure_installed = { "lua", "javascript", "jsonc", "gitignore" },
	auto_install = true,

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},

	indent = {
		enable = true,
	},
})


-- local opt = vim.opt

-- opt.foldmethod = "expr"
-- opt.foldmethod = "indent"
-- opt.foldexpr = "nvim_treesitter#foldexpr()"
-- opt.foldenable = false
-- opt.foldnestmax = 1
