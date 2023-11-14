-- Appearance

vim.cmd.colorscheme("catppuccin") -- I dont know how fix bufferline :(
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
SetupKeymap("nv", "<leader>e", "<cmd>NvimTreeFindFileToggle<CR>")

SetupKeymap("n", "<C-w>", function() -- TODO
	vim.cmd("BufDel")

	if vim.api.nvim_buf_line_count(0) < 2 then
		vim.cmd("NvimTreeFindFileToggle")
		vim.cmd("NvimTreeFindFileToggle")
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
