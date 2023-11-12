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

local plugins = {

	"nvim-tree/nvim-web-devicons",

	"ellisonleao/gruvbox.nvim",
	"folke/tokyonight.nvim",
	"catppuccin/nvim",

	"phaazon/hop.nvim",

	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",

	{ "nvim-tree/nvim-tree.lua", dependencies = "nvim-tree/nvim-web-devicons" },
	{ "akinsho/bufferline.nvim", dependencies = "nvim-tree/nvim-web-devicons" },

	"ojroques/nvim-bufdel",
	"akinsho/toggleterm.nvim",
	{ "nvim-lualine/lualine.nvim", dependencies = "nvim-tree/nvim-web-devicons" },
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

	"neovim/nvim-lspconfig",
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	"numToStr/Comment.nvim",

	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
	},

	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"FelipeLema/cmp-async-path",
			"neovim/nvim-lspconfig",
			{ "saadparwaiz1/cmp_luasnip", dependencies = "L3MON4D3/LuaSnip" },
			{ "tzachar/cmp-tabnine", build = "./install.sh", dependencies = "hrsh7th/nvim-cmp" },
		},
	},

	"mhartington/formatter.nvim",
}

local opts = {}

require("lazy").setup(plugins, opts)
