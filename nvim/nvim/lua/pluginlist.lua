return {
	-- {
	-- 	"3rd/image.nvim",
	-- 	-- enabled = false,
	-- 	opts = {
	-- 		rocks = {
	-- 			hererocks = true,
	-- 		},
	-- 	},
	-- },
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
	{
		'nvim-lualine/lualine.nvim',
		dependencies = {
			"nvim-tree/nvim-web-devicons"
		},
	},
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"clangd",
				"css-lsp",
				"html-lsp",
				"lua-language-server",
				"phpactor",
				"typescript-language-server",
				"php-cs-fixer",
				"phpcs",
				"js-debug-adapter"
			}
		}
	},
	{
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
	{
		'barrett-ruth/live-server.nvim',
		build = 'pnpm add -g live-server',
		cmd = { 'LiveServerStart', 'LiveServerStop' },
		config = true
	},
	{
		'echasnovski/mini.icons',
		version = false,
		config = function()
			require('mini.icons').setup()
		end
	},
	{
		"OXY2DEV/markview.nvim",
		lazy = false
	},
	{
		'pysan3/fcitx5.nvim',
		lazy = false,
		cond = vim.fn.executable("fcitx5-remote") == 1,
		event = { "ModeChanged" },
	},
	-- "puremourning/vimspector",
	"nvim-tree/nvim-web-devicons",
	"prichrd/netrw.nvim",
	"mbbill/undotree",
	"lambdalisue/vim-suda",
	"tpope/vim-fugitive",
	"tpope/vim-obsession",
	"christoomey/vim-tmux-navigator",
	"onsails/lspkind.nvim",
	-- {
	-- 	'vim-skk/eskk.vim',
	-- 	lazy = false,
	-- },
}
