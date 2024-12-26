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
	"puremourning/vimspector",
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
-- {
-- 	"rcarriga/nvim-dap-ui",
-- 	dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" }
-- },
-- -- JS Debug Adapter for DAP
-- {
-- 	"microsoft/vscode-js-debug",
-- 	build = "npm install --legacy-peer-deps --no-save && npx gulp vsDebugServerBundle && rm -rf out && mv dist out",
-- 	version = "1.*",
-- },
-- {
-- 	"mxsdev/nvim-dap-vscode-js",
-- 	dependencies = { "mfussenegger/nvim-dap" },
-- 	config = function()
-- 		require("dap-vscode-js").setup({
-- 			-- Path to node executable, defaults to system node
-- 			node_path = "node",
-- 			-- Path to the vscode-js-debug installation
-- 			debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug",
-- 			-- Adapters to register
-- 			adapters = {
-- 				"chrome",
-- 				"pwa-node",
-- 				"pwa-chrome",
-- 				"pwa-msedge",
-- 				"pwa-extensionHost",
-- 				"node-terminal",
-- 			},
-- 			-- Optional logging
-- 			-- log_file_path = vim.fn.stdpath("cache") .. "/dap_vscode_js.log",
-- 			-- log_file_level = vim.log.levels.DEBUG,
-- 			-- log_console_level = vim.log.levels.ERROR,
-- 		})
-- 	end,
-- },
-- {
-- 	-- JSON5 library
-- 	"Joakker/lua-json5",
-- 	build = "./install.sh",
-- },

