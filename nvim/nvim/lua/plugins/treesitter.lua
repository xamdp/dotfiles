return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = 'master',
		lazy = false,
		build = ":TSUpdate",
		config = function ()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = { "lua", "c", "html", "javascript" },
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
				auto_install = true,
				ignore_install = {},
			})
		end
	}
}
