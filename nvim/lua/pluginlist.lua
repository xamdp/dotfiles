return {
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end
	},
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = function()
			vim.cmd("colorscheme gruvbox")
		end
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require('gitsigns').setup()
		end
	},
	-- {
	-- 	'nvim-lualine/lualine.nvim',
	-- 	dependencies = {
	-- 		"nvim-tree/nvim-web-devicons"
	-- 	},
	-- },
	{
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	},
	"folke/neodev.nvim", opts = {},
	{
		'hrsh7th/nvim-cmp',
		dependencies = {
			'L3MON4D3/LuaSnip',
			'saadparwaiz1/cmp_luasnip',
			'rafamadriz/friendly-snippets',
			'hrsh7th/cmp-nvim-lsp',
		},
	},
	{
		'L3MON4D3/LuaSnip',
		-- follow latest release.
		version = "v2.*", --  Repleace <CurrentMajor> by the latest release major (first number of latest release)
		-- install jsregexp (optional!).
		build = "make_install_jsregexp"
	},
	{
		'nvim-telescope/telescope.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
	},
	{
		'ThePrimeagen/harpoon',
		branch = "harpoon2",
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	"nvim-tree/nvim-web-devicons",
	"prichrd/netrw.nvim",
	"mbbill/undotree",
	"lambdalisue/vim-suda",
	"barrett-ruth/live-server.nvim",
	"tpope/vim-fugitive",
	"tpope/vim-obsession",
	"christoomey/vim-tmux-navigator",
	"onsails/lspkind.nvim",
	"andweeb/presence.nvim",
	"vim-skk/eskk.vim",
}
