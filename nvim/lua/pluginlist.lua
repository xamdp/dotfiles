return {
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end
	},
	{
		"ellisonleao/gruvbox.nvim",
		opts = {
			transparent = true,
		},
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
	{
		'ThePrimeagen/harpoon',
		branch = "harpoon2",
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	"prichrd/netrw.nvim",
	"mbbill/undotree",
	"/lambdalisue/suda.vim",
	"barrett-ruth/live-server.nvim",
	"tpope/vim-fugitive",
	"tpope/vim-obsession",
	"tpope/vim-dadbod",
	"kristijanhusak/vim-dadbod-ui",
	"christoomey/vim-tmux-navigator",
	"kristijanhusak/vim-dadbod-completion",
	-- "nvim-tree/nvim-tree.lua",
	"rcarriga/nvim-notify",
	"epwalsh/obsidian.nvim",
	"onsails/lspkind.nvim",
	{
		'mfussenegger/nvim-dap',
		dependencies = {
			'rcarriga/nvim-dap-ui',
			'theHamsta/nvim-dap-virtual-text',
			'nvim-telescope/telescope-dap.nvim'
		},
	}
}
