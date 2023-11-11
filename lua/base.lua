local opt = vim.opt

-- File
opt.swapfile = false
opt.encoding = 'utf-8'

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
vim.g.mapleader = ' '

-- Input
-- vim.cmd('set timeoutlen=1000')

-- Mapping Functions
function MapN(key, command)
  vim.keymap.set('n', key, command, { noremap = true, nowait = true })
end

function MapV(key, command)
  vim.keymap.set('v', key, command, { noremap = true, nowait = true })
end

function MapT(key, command)
  vim.keymap.set('v', key, command, { noremap = true, nowait = true })
end

function MapI(key, command)
  vim.keymap.set('i', key, command, { noremap = true, nowait = true })
end

function MapNVTI(key, command)
  vim.keymap.set({ 'n', 'v', 't' }, key, command, { noremap = true, nowait = true })
end

function MapVI(key, command)
  vim.keymap.set({ 'v', 'i' }, key, command, { noremap = true, nowait = true })
end

function MapNVT(key, command)
  vim.keymap.set({ 'n', 'v', 't' }, key, command, { noremap = true, nowait = true })
end

function MapNV(key, command)
  vim.keymap.set({ 'n', 'v', 't' }, key, command, { noremap = true, nowait = true })
end
