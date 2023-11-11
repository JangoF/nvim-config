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

local fixBufferLineSeparatorColor = function()
	local baseGroup = vim.api.nvim_get_hl_by_name("NvimTreeWinSeparator", true)
	local additionalGroup = vim.api.nvim_get_hl_by_name("BufferLineTab", true)

	if baseGroup.foreground == baseGroup.background then
		baseGroup.foreground = additionalGroup.background
	end

	baseGroup.background = additionalGroup.background
	vim.api.nvim_set_hl(0, "BufferLineOffsetSeparator", baseGroup)
end

vim.api.nvim_create_autocmd("ColorScheme", { callback = fixBufferLineSeparatorColor })
fixBufferLineSeparatorColor()

MapN("1", "<cmd>BufferLineGoToBuffer 1<CR>")
MapN("2", "<cmd>BufferLineGoToBuffer 2<CR>")
MapN("3", "<cmd>BufferLineGoToBuffer 3<CR>")
MapN("4", "<cmd>BufferLineGoToBuffer 4<CR>")
MapN("5", "<cmd>BufferLineGoToBuffer 5<CR>")
MapN("6", "<cmd>BufferLineGoToBuffer 6<CR>")
MapN("7", "<cmd>BufferLineGoToBuffer 7<CR>")
MapN("8", "<cmd>BufferLineGoToBuffer 8<CR>")
MapN("9", "<cmd>BufferLineGoToBuffer 9<CR>")

MapN("<S-h>", "cmd>BufferLineCyclePrev<CR>")
MapN("<S-l>", "cmd>BufferLineCycleNext<CR>")
