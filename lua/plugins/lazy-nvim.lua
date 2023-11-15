local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

	-- Code

	{ "williamboman/mason.nvim", config = true, event = "BufAdd" },
	{
		"williamboman/mason-lspconfig.nvim",
		config = true,
		dependencies = { { "williamboman/mason.nvim" }, { "neovim/nvim-lspconfig" } },
		event = "BufAdd",
	},

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = require("plugins.treesitter"),
		event = "BufAdd",
	},
	{ "mhartington/formatter.nvim", config = require("plugins.formatter"), event = "BufAdd" },

	{ "neovim/nvim-lspconfig", config = require("plugins.lspconfig"), event = "BufAdd" },
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", config = true, event = "BufAdd" },

	{ "numToStr/Comment.nvim", config = require("plugins.comment"), event = "BufAdd" },
	{ "phaazon/hop.nvim", config = require("plugins.hop"), dependencies = "nvim-tree/nvim-tree.lua", event = "BufAdd" },
	{ "windwp/nvim-autopairs", event = "InsertEnter", config = true },
	{ "lewis6991/gitsigns.nvim", opts = { signcolumn = false }, event = "BufAdd", config = true },

	-- Completion

	require("plugins/completion"),

	-- Editor

	{ "akinsho/bufferline.nvim", config = require("plugins.bufferline"), dependencies = "nvim-tree/nvim-web-devicons" },
	{ "kazhala/close-buffers.nvim", config = true },

	{ "akinsho/toggleterm.nvim", config = require("plugins.toggleterm") },
	{ "nvim-tree/nvim-tree.lua", config = require("plugins.nvim-tree"), dependencies = "nvim-tree/nvim-web-devicons" },

	{
		"nvim-lualine/lualine.nvim",
		config = require("plugins.lualine"),
		dependencies = "nvim-tree/nvim-web-devicons",
	},

	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
		config = require("plugins.telescope"),

		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
	},

	-- Appearance

	{ "nvim-tree/nvim-web-devicons", config = true },

	{ "ellisonleao/gruvbox.nvim", opts = { contrast = "hard" }, lazy = false, priority = 1000 },
	{ "folke/tokyonight.nvim", opts = { style = "night" }, lazy = false, priority = 1000 },
	{ "catppuccin/nvim", name = "catppuccin", opts = { flavour = "macchiato" }, lazy = false, priority = 1000 },
}, {})
