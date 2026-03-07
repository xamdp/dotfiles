return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	lazy = false,
	opts = {
		formatters_by_ft = {
			lua = { "stylua", stop_after_first = true },
			javascript = { "prettier", stop_after_first = true },
			javascriptreact = { "prettier", stop_after_first = true },
			json = { "prettier", stop_after_first = true },
			html = { "prettier" },
			typescript = { "prettier", stop_after_first = true },
			typescriptreact = { "prettier", stop_after_first = true },
			tailwindcss = { "prettier", stop_after_first = true },
			c = { "clang-format" },
			cpp = { "clang-format" },
			java = { "jdtls" },
		},
		formatters = {
			clang_format = {
				prepend_args = { "--style=file", "--fallback-style=LLVM" },
			},
		},
		default_format_opts = {
			lsp_format = "fallback",
		},
		format_on_save = {
			timeout = 1000,
			lsp_format = "fallback",
		},
		log_level = vim.log.levels.DEBUG,
	},
}
