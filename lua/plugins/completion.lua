return {
	"hrsh7th/nvim-cmp",

	dependencies = {
		"hrsh7th/cmp-buffer",
		"FelipeLema/cmp-async-path",
		"hrsh7th/cmp-nvim-lsp",
		"saadparwaiz1/cmp_luasnip",
		"tzachar/cmp-tabnine",
		"hrsh7th/cmp-nvim-lua",

		"L3MON4D3/LuaSnip",
		"rafamadriz/friendly-snippets",
	},

	event = "InsertEnter",

	config = function()
		vim.opt.completeopt = { "menu", "menuone", "noselect" }
		require("luasnip.loaders.from_vscode").lazy_load()

		local cmp = require("cmp")
		local luasnip = require("luasnip")

		cmp.setup({
			snippet = {
				expand = function(arguments)
					luasnip.lsp_expand(arguments.body)
				end,
			},

			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},

			mapping = cmp.mapping.preset.insert({
				["<CR>"] = cmp.mapping.confirm({ select = false }),
			}),

			formatting = {
				fields = { "menu", "abbr", "kind" },

				format = function(entry, vim_item)
					local cmp_kinds = {
						Text = "  ",
						Method = "  ",
						Function = "  ",
						Constructor = "  ",
						Field = "  ",
						Variable = "  ",
						Class = "  ",
						Interface = "  ",
						Module = "  ",
						Property = "  ",
						Unit = "  ",
						Value = "  ",
						Enum = "  ",
						Keyword = "  ",
						Snippet = "  ",
						Color = "  ",
						File = "  ",
						Reference = "  ",
						Folder = "  ",
						EnumMember = "  ",
						Constant = "  ",
						Struct = "  ",
						Event = "  ",
						Operator = "  ",
						TypeParameter = "  ",
					}

					if entry.source.name == "cmp_tabnine" then
						local detail = entry.completion_item.data.completion_metadata.detail
						detail = string.gsub(detail, "%s+", "")
						vim_item.kind = "  " .. detail
					else
						vim_item.kind = (cmp_kinds[vim_item.kind] or "") .. vim_item.kind .. " "
					end

					return vim_item
				end,
			},

			sources = cmp.config.sources({
				{ name = "luasnip", max_item_count = 2 },
				{ name = "cmp_tabnine", max_item_count = 2 },
				{ name = "nvim_lsp", max_item_count = 2 },
				{ name = "buffer", max_item_count = 2 },
				{ name = "nvim_lua", max_item_count = 2 },
				{ name = "async_path", max_item_count = 8 },
			}),
		})

		require("cmp_tabnine.config"):setup({
			max_lines = 1000,
			max_num_results = 2,
			sort = true,
			run_on_every_keystroke = true,
			snippet_placeholder = "..",
			ignored_file_types = {},
			show_prediction_strength = true,
		})
	end,
}
