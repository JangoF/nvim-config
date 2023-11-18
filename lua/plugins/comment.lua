return function()
	require("Comment").setup({
		ignore = "^$",

		toggler = {
			line = "gc",
			block = "gb",
		},

		mappings = {
			extra = false,
		},
	})
end
