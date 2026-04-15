return {
	"mbbill/undotree",
	"lambdalisue/vim-suda",
	{
		"nvim-tree/nvim-web-devicons",
		opts = {},
	},
	{
		"j-hui/fidget.nvim",
		opts = {},
	},
	{
		"nvim-mini/mini.icons",
		version = "*",
		opts = function()
			require("mini.icons").setup()
		end,
	},
}
