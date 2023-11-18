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

	{
		"williamboman/mason.nvim",
		opts = {
			ui = {
				border = "single",
			},
		},
		event = "BufAdd",
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = true,
		dependencies = { { "williamboman/mason.nvim" }, { "neovim/nvim-lspconfig" } },
		event = "BufAdd",
	},

	require("plugins/treesitter"),
	{ "mhartington/formatter.nvim", config = require("plugins.formatter"), event = "BufAdd" },
	-- {
	-- 	"yamatsum/nvim-cursorline",
	-- 	event = "BufAdd",

	-- 	config = function()
	-- 		require("nvim-cursorline").setup({
	-- 			cursorline = {
	-- 				enable = true,
	-- 				timeout = 0,
	-- 				number = false,
	-- 			},
	-- 			cursorword = {
	-- 				enable = true,
	-- 				min_length = 3,
	-- 				hl = { underline = true },
	-- 			},
	-- 		})
	-- 	end,
	-- },
	{
		"smjonas/inc-rename.nvim",
		event = "BufAdd",

		config = function()
			require("inc_rename").setup({
				-- cmd_name = "IncRename", -- the name of the command
				-- hl_group = "Substitute", -- the highlight group used for highlighting the identifier's new name
				-- preview_empty_name = false, -- whether an empty new name should be previewed; if false the command preview will be cancelled instead
				-- show_message = true, -- whether to display a `Renamed m instances in n files` message after a rename operation
				-- input_buffer_type = nil, -- the type of the external input buffer to use (the only supported value is currently "dressing")
				-- post_hook = nil, -- callback to run after renaming, receives the result table (from LSP handler) as an argument
			})
		end,
	},

	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			lsp = {
				-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
				override = {
					-- ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					-- ["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = false,
				},
			},
			-- add any options here
			presets = {
				inc_rename = true,
				command_palette = true,
				lsp_doc_border = true,
			},
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
	},

	{ "neovim/nvim-lspconfig", config = require("plugins.lspconfig"), event = "BufAdd" },
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", config = true, event = "BufAdd" },
	-- {
	-- 	"kylechui/nvim-surround",
	-- 	version = "*", -- Use for stability; omit to use `main` branch for the latest features
	-- 	event = "VeryLazy",
	-- 	config = function()
	-- 		require("nvim-surround").setup({
	-- 			keymaps = {
	-- 				insert = "<C-g>s",
	-- 				insert_line = "<C-g>S",
	-- 				normal = "ys",
	-- 				normal_cur = "yss",
	-- 				normal_line = "yS",
	-- 				normal_cur_line = "ySS",
	-- 				visual = "S",
	-- 				visual_line = "gS",
	-- 				delete = "ds",
	-- 				change = "cs",
	-- 				change_line = "cS",
	-- 			},
	-- 			surrounds = {
	-- 				["("] = {
	-- 					add = { "( ", " )" },
	-- 					find = function()
	-- 						require("nvim-surround.treesitter").get_selection({ motion = "a(" })
	-- 					end,
	-- 					delete = "^(. ?)().-( ?.)()$",
	-- 				},
	-- 			},
	-- 			aliases = {
	-- 				["a"] = ">",
	-- 				["b"] = ")",
	-- 				["B"] = "}",
	-- 				["r"] = "]",
	-- 				["q"] = { '"', "'", "`" },
	-- 				["s"] = { "}", "]", ")", ">", '"', "'", "`" },
	-- 			},
	-- 		})
	-- 	end,
	-- },

	{ "numToStr/Comment.nvim", config = require("plugins.comment"), event = "BufAdd" },
	{ "phaazon/hop.nvim", config = require("plugins/hop"), dependencies = "nvim-tree/nvim-tree.lua", event = "BufAdd" },
	{ "windwp/nvim-autopairs", event = "InsertEnter", config = true },
	require("plugins/gitsigns"),

	-- Completion

	require("plugins/completion"),

	-- Editor

	{
		"akinsho/bufferline.nvim",
		config = require("plugins/bufferline"),
		dependencies = "nvim-tree/nvim-web-devicons",
		event = "VimEnter",
	},
	{ "akinsho/toggleterm.nvim", config = require("plugins/toggleterm") },
	{ "nvim-tree/nvim-tree.lua", config = require("plugins/nvim-tree"), dependencies = "nvim-tree/nvim-web-devicons" },

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
}, {
	ui = {
		border = "single",
	},
})
