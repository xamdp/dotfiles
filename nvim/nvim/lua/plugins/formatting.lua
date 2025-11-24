return {
	{
		'stevearc/conform.nvim',
		lazy = false,
		keys = {
			{
				'<leader>f',
				function()
					require('conform').format { async = true, lsp_fallback = true }
				end,
				mode = '',
				desc = '[F]ormat buffer',
			}
		},
		opts = function()
			local prettier = { "prettierd", "prettier", stop_after_first = true }
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					javascript = prettier,
					javascriptreact = prettier,
					json = prettier,
					html = prettier,
					c = { "clang-format" },
					cpp = { "clang-format" },
				},
				formatters = {
					clang_format = {
						prepend_args = { "--style=file", '--fallback-style=LLVM' },
					},
				},
				format_on_save = function(bufnr)
					local no_lsp_fallback = { c = true, cpp = true }
					return {
						timeout_ms = 500,
						lsp_fallback = not no_lsp_fallback[vim.bo[bufnr].filetype],
					}
				end,
				notify_on_error = true,
			})
		end
	},
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup()
		end
	},
}
