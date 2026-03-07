return {
	"mbbill/undotree",
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
	{
		"windwp/nvim-ts-autotag",
		ft = { "html", "javascript", "typescriptreact", "tsx", "jsx" },
		config = function()
			require("nvim-ts-autotag").setup({
				enable_close_on_slash = false,
			})
		end,
	},
}
