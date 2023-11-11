-- tokyonight
require("tokyonight").setup({
	style = "night",
})

-- gruvbox
require("gruvbox").setup({
	contrast = "hard",
})

-- catppuccin
require("catppuccin").setup({
	flavour = "macchiato",
})

-- nvim-web-devicons
require("nvim-web-devicons").setup({})

-- appearance
local opt = vim.opt

opt.colorcolumn = "80"
opt.signcolumn = "number"
opt.termguicolors = true
opt.fillchars = { eob = " " }

opt.background = "dark"

-- vim.cmd.colorscheme('tokyonight')
-- vim.cmd.colorscheme('catppuccin')
vim.cmd.colorscheme("gruvbox")
