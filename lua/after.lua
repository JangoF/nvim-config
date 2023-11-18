-- Appearance

vim.cmd.colorscheme("catppuccin")

-- Keymap

SetupKeymap("nvt", "<C-h>", "<cmd>wincmd h<CR>", "Switch to window on the left")
SetupKeymap("nvt", "<C-j>", "<cmd>wincmd j<CR>", "Switch to window below")
SetupKeymap("nvt", "<C-k>", "<cmd>wincmd k<CR>", "Switch to window above")
SetupKeymap("nvt", "<C-l>", "<cmd>wincmd l<CR>", "Switch to window on the right")

SetupKeymap("nvt", "<C-s>", "<cmd>w!<CR>", "Save current buffer")
SetupKeymap("nvt", "<C-q>", "<cmd>qa<CR>", "Quit")

SetupKeymap("n", "<ESC>", "<cmd>nohlsearch<CR>", "Reset search highlighting")
SetupKeymap("n", "<leader>vs", "<cmd>vsplit<CR>", "Vertical split")

SetupKeymap("nv", "<S-j>", "10j", "Move the cursor up quickly")
SetupKeymap("nv", "<S-k>", "10k", "Move the cursor down quickly")
SetupKeymap("nv", "<leader>e", "<cmd>NvimTreeToggle<CR>", "Open File Browser")

SetupKeymap("n", "<leader>rn", function()
	return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true })

function ShiftLine(direction)
	vim.api.nvim_command("normal! " .. direction)
	vim.api.nvim_command("normal! gv")
end

SetupKeymap("v", "<", "<cmd>lua ShiftLine('<')<CR>")
SetupKeymap("v", ">", "<cmd>lua ShiftLine('>')<CR>")

SetupKeymap("n", "<C-w>", function()
	local current_buffer = vim.fn.bufnr("%")
	local elements = require("bufferline").get_elements().elements

	if #elements == 1 then -- If current buffer is the last one
		local current_window = vim.api.nvim_get_current_win()

		if vim.fn.bufexists(vim.fn.bufnr("NvimTree_1")) == 0 then
			vim.cmd("NvimTreeOpen")
		end

		vim.cmd("quit " .. current_window)
		vim.cmd("bdelete " .. current_buffer)
		return
	end

	if current_buffer == elements[#elements].id then -- If current buffer is the last one in bufferline
		vim.cmd("bprevious")
	else
		vim.cmd("bnext")
	end

	vim.cmd("bdelete " .. current_buffer)
end, "Close current buffer")

SetupKeymap("n", "f", function()
	if vim.fn.bufnr("NvimTree_1") ~= vim.fn.bufnr("%") then
		vim.cmd("HopWord")
		return
	end

	local hop = require("hop")
	local jump_target = require("hop.jump_target")

	local generator = jump_target.jump_targets_by_scanning_lines
	local options = require("hop.defaults")

	hop.hint_with_callback(generator(jump_target.regex_by_line_start_skip_whitespace()), options, function(target)
		hop.move_cursor_to(target.window, target.line + 1, target.column - 1, options.hint_offset, options.direction)
		require("nvim-tree.api").node.open.edit()
	end)
end, "Show hop highlighting")

-- SetupKeymap("n", "<leader>cs", "<cmd>Telescope colorscheme<CR>")
SetupKeymap("n", "<leader>cs", function()
	require("telescope.builtin").colorscheme({
		enable_preview = true,
	})
end, "Show colorscheme list")

SetupKeymap("n", "<leader>ff", function()
	if vim.fn.bufnr("NvimTree_1") ~= vim.fn.bufnr("%") then
		vim.cmd("Telescope find_files")
		return
	end

	local selected_entry = require("nvim-tree.api").tree.get_node_under_cursor()

	if selected_entry.type == "directory" then
		require("telescope.builtin").find_files({
			prompt_title = "Find Files in Directory",
			cwd = selected_entry.absolute_path,
		})
	end
end)

SetupKeymap("n", "<leader>lg", function()
	if vim.fn.bufnr("NvimTree_1") ~= vim.fn.bufnr("%") then
		vim.cmd("Telescope live_grep")
		return
	end

	local selected_entry = require("nvim-tree.api").tree.get_node_under_cursor()

	if selected_entry.type == "directory" then
		require("telescope.builtin").live_grep({
			prompt_title = "Live Grep in Directory",
			cwd = selected_entry.absolute_path,
		})
	end
end)

-- Other

local fixBufferLineSeparatorColor = function()
	local baseGroup = vim.api.nvim_get_hl(0, { name = "NvimTreeWinSeparator" })
	local additionalGroup = vim.api.nvim_get_hl(0, { name = "BufferLineTab" })

	if baseGroup.foreground == baseGroup.background then
		baseGroup.foreground = additionalGroup.background
	end

	baseGroup.background = additionalGroup.background
	vim.api.nvim_set_hl(0, "BufferLineOffsetSeparator", baseGroup)
end

vim.api.nvim_create_autocmd("ColorScheme", { callback = fixBufferLineSeparatorColor })
fixBufferLineSeparatorColor()

IsInserEnterActivated = false

vim.api.nvim_create_autocmd("InsertEnter", {
	callback = function()
		if IsInserEnterActivated then
			return
		end

		IsInserEnterActivated = true
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
	end,
})
