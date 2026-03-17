return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "master",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = { "lua", "c", "html", "javascript", "http", "sql" },
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
				auto_install = true,
				ignore_install = {},
				enable_close_on_slash = false,
			})
		end,
	},
}
