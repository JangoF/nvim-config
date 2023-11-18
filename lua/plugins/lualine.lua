return function()
	require("lualine").setup({ -- this setup removed splash screen :(
		options = {
			globalstatus = true,
		},
		-- sections = {
			-- lualine_a = {
			-- 	{ "mode", separator = { left = "", right = "" }, right_padding = 2 },
			-- },
			-- lualine_b = { "filename", "branch" },
			-- lualine_c = { "fileformat" },
			-- lualine_x = {},
			-- lualine_y = { "filetype", "progress" },
			-- lualine_z = {
			-- 	{ "location", separator = { right = "" }, left_padding = 2 },
			-- },
		-- },
		-- inactive_sections = {
		-- 	lualine_a = { "filename" },
		-- 	lualine_b = {},
		-- 	lualine_c = {},
		-- 	lualine_x = {},
		-- 	lualine_y = {},
		-- 	lualine_z = { "location" },
		-- },
	})
end
