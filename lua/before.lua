local opt = vim.opt

-- File
opt.swapfile = false
opt.encoding = "utf-8"

-- Tab
local tab_width = 2

opt.tabstop = tab_width
opt.shiftwidth = tab_width

opt.smarttab = true
opt.expandtab = true
opt.smartindent = true

-- Scroll
opt.scrolloff = 8
opt.sidescrolloff = 16

-- Line
opt.wrap = false
opt.cursorline = true

opt.number = true
opt.relativenumber = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.showmatch = true

-- Leader key
vim.g.mapleader = " "

-- Input
vim.cmd("set timeoutlen=1000")

-- Mapping Functions

function SetupKeymap(mode, key, command, options)
	local characters = {}
	for i = 1, #mode do
		table.insert(characters, mode:sub(i, i))
	end

	vim.keymap.set(characters, key, command, options or { noremap = true, nowait = true })
end
