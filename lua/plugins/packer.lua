require('packer').startup(function(use)
  use { 'wbthomason/packer.nvim' }

  use { 'ellisonleao/gruvbox.nvim' }
  use { 'folke/tokyonight.nvim' }
  use { 'catppuccin/nvim', as = 'catppuccin' }
  use { 'nvim-tree/nvim-web-devicons' }

  use { 'phaazon/hop.nvim' }
  use { 'nvim-tree/nvim-tree.lua' }

  use { 'nvim-telescope/telescope.nvim', requires = { { 'nvim-lua/plenary.nvim' } } }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  use { 'akinsho/bufferline.nvim' }
  use { 'ojroques/nvim-bufdel' }
  use { 'akinsho/toggleterm.nvim' }
  use { 'nvim-lualine/lualine.nvim' }

  use { 'lukas-reineke/indent-blankline.nvim' }
  use { 'neovim/nvim-lspconfig' }
  use { 'nvim-treesitter/nvim-treesitter' }
  use { 'numToStr/Comment.nvim' }

  use { 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/cmp-path' }
  use { 'saadparwaiz1/cmp_luasnip' }
  use({	'L3MON4D3/LuaSnip', run = 'make install_jsregexp' })

end)
