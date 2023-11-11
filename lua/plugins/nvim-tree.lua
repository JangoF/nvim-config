vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local api = require("nvim-tree.api")

local function on_attach(bufnr)
	vim.keymap.set("n", "h", api.node.navigate.parent_close, { buffer = bufnr, noremap = true })
	vim.keymap.set("n", "l", api.node.open.edit, { buffer = bufnr, noremap = true })
	vim.keymap.set("n", "a", api.fs.create, { buffer = bufnr, noremap = true })
	vim.keymap.set("n", "d", api.fs.remove, { buffer = bufnr, noremap = true })

	vim.keymap.set("n", "f", function()
		local hop = require("hop")
		local jump_target = require("hop.jump_target")

		local generator = jump_target.jump_targets_by_scanning_lines
		local options = require("hop.defaults")

		hop.hint_with_callback(generator(jump_target.regex_by_line_start_skip_whitespace()), options, function(target)
			hop.move_cursor_to(
				target.window,
				target.line + 1,
				target.column - 1,
				options.hint_offset,
				options.direction
			)
			api.node.open.edit()
		end)
	end, { buffer = bufnr, noremap = true })
end

require("nvim-tree").setup({
	on_attach = on_attach,
	hijack_unnamed_buffer_when_opening = true,
	sync_root_with_cwd = true,

	renderer = {
		root_folder_label = false,
	},

	view = {
		width = 40,
	},
})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
	callback = function()
		require("nvim-tree.api").tree.open()
	end,
})
