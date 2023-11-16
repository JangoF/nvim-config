-- Appearance

vim.cmd.colorscheme("catppuccin")

-- Keymap

SetupKeymap("nvt", "<C-h>", "<cmd>wincmd h<CR>")
SetupKeymap("nvt", "<C-j>", "<cmd>wincmd j<CR>")
SetupKeymap("nvt", "<C-k>", "<cmd>wincmd k<CR>")
SetupKeymap("nvt", "<C-l>", "<cmd>wincmd l<CR>")
SetupKeymap("nvt", "<C-s>", "<cmd>w!<CR>")
SetupKeymap("nvt", "<C-q>", "<cmd>qa<CR>")

SetupKeymap("n", "<ESC>", "<cmd>nohlsearch<CR>")
SetupKeymap("n", "<leader>vs", "<cmd>vsplit<CR>")
SetupKeymap("n", "<leader>ff", "<cmd>Format<CR>")

SetupKeymap("nv", "<S-j>", "10j")
SetupKeymap("nv", "<S-k>", "10k")
SetupKeymap("nv", "<leader>e", "<cmd>NvimTreeToggle<CR>")

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
	else
		if current_buffer == elements[#elements].id then -- If current buffer is the last one in bufferline
			vim.cmd("bprevious")
		else
			vim.cmd("bnext")
		end

		vim.cmd("bdelete " .. current_buffer)
	end
end)

function ShiftLine(direction)
	vim.api.nvim_command("normal! " .. direction)
	vim.api.nvim_command("normal! gv")
end

SetupKeymap("v", "<", "<cmd>lua ShiftLine('<')<CR>")
SetupKeymap("v", ">", "<cmd>lua ShiftLine('>')<CR>")

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
