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

	{ "nvim-tree/nvim-web-devicons", config = true },

	{ "ellisonleao/gruvbox.nvim", priority = 1000, opts = { contrast = "hard" } },
	{ "folke/tokyonight.nvim", priority = 1000, opts = { style = "night" } },
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000, opts = { flavour = "macchiato" } },

	{ "numToStr/Comment.nvim", config = require("plugins.comment") },
	{ "phaazon/hop.nvim", config = require("plugins.hop"), dependencies = "nvim-tree/nvim-tree.lua" },

	{ "akinsho/toggleterm.nvim", config = require("plugins.toggleterm") },
	{ "nvim-tree/nvim-tree.lua", config = require("plugins.nvim-tree"), dependencies = "nvim-tree/nvim-web-devicons" },

	{ "akinsho/bufferline.nvim", config = require("plugins.bufferline"), dependencies = "nvim-tree/nvim-web-devicons" },
	{ "ojroques/nvim-bufdel", config = true },

	{ "mhartington/formatter.nvim", config = require("plugins.formatter") },
	{ "neovim/nvim-lspconfig", config = require("plugins.lspconfig") },

	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", config = true },
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate", config = require("plugins.treesitter") },

	{ "williamboman/mason.nvim", config = true },
	{
		"williamboman/mason-lspconfig.nvim",
		config = true,
		dependencies = { { "williamboman/mason.nvim" }, { "neovim/nvim-lspconfig" } },
	},

	{ "hrsh7th/nvim-cmp", config = require("plugins.nvim-cmp") },
	{ "hrsh7th/cmp-buffer", dependencies = { "hrsh7th/nvim-cmp" } },
	{ "FelipeLema/cmp-async-path", dependencies = { "hrsh7th/nvim-cmp" } },
	{ "hrsh7th/cmp-nvim-lsp", dependencies = { { "hrsh7th/nvim-cmp" }, { "neovim/nvim-lspconfig" } } },
	{ "saadparwaiz1/cmp_luasnip", dependencies = { { "hrsh7th/nvim-cmp" }, { "L3MON4D3/LuaSnip" } } },

	{ "L3MON4D3/LuaSnip", version = "v2.*", build = "make install_jsregexp" },
	{ "rafamadriz/friendly-snippets" },
	{
		"tzachar/cmp-tabnine",
		build = "./install.sh",
		config = require("plugins.cmp-tabnine"),
		dependencies = { "hrsh7th/nvim-cmp" },
	},

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
}, {})
