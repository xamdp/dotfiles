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
		opts = function()
			require("nvim-ts-autotag").setup({
				opts = {
					enable_close = true,
					enable_rename = true,
					enable_close_on_slash = false,
				},
				per_filetype = {
					["html"] = { enable_close = false },
				},
			})
		end,
	},
}
