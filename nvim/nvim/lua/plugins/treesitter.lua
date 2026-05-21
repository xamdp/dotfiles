return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		build = ":TSUpdate",
		opts = {
			ensure_installed = { "lua", "c", "html", "javascript", "http", "sql", "markdown", "markdown_inline" },
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
			auto_install = true,
			ignore_install = {},
			enable_close_on_slash = false,
		},
	},
}
