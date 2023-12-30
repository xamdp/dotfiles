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
		'nvim-lualine/lualine.nvim',
		dependencies = {
			"nvim-tree/nvim-web-devicons"
		},
		config = function()
			require("lualine").setup({
				icons_enabled = true,
				theme = 'gruvbox',

			})
		end,
	},

	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",

	{ "folke/neodev.nvim", opts = {} },

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
		'nvim-telescope/telescope.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},

	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
	},
	"ThePrimeagen/harpoon",
	"mbbill/undotree",
	"/lambdalisue/suda.vim",
	"barrett-ruth/live-server.nvim",
	"tpope/vim-fugitive",
	{
		'prichrd/netrw.nvim',
		dependencies = 'nvim-tree/nvim-web-devicons'
	},
}
