return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"nvim-telescope/telescope-ui-select.nvim",

			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		config = function()
			local builtin = require("telescope.builtin")

			vim.keymap.set("n", "<leader>ff", function()
				builtin.find_files({
					hidden = true,
					no_ignore = true,
					file_ignore_patterns = {
						"node_modules",
						".git",
						".cache",
						"dist",
						"build",
						".next",
					},
				})
			end, { desc = "Telescope find files" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

			-- Bonus LSP-friendly keymaps (highly recommended now that you're all-in on Telescope)
			vim.keymap.set(
				"n",
				"<leader>sw",
				builtin.lsp_dynamic_workspace_symbols,
				{ desc = "LSP: Workspace symbols" }
			)

			-- Telescope setup with beautiful themes for ALL your LSP mappings
			require("telescope").setup({
				defaults = {
					mappings = {
						i = { ["<C-h>"] = "which_key" },
					},
				},
				pickers = {
					-- These make gd, gr, gi, gt, <leader>ss look amazing
					lsp_definitions = { theme = "ivy" },
					lsp_references = { theme = "ivy" },
					lsp_implementations = { theme = "ivy" },
					lsp_type_definitions = { theme = "ivy" },
					lsp_document_symbols = { theme = "ivy" },
					lsp_dynamic_workspace_symbols = { theme = "ivy" },
					find_files = { theme = "cursor", hidden = true },
				},
			})

			-- Makes code actions, etc. use a nicer dropdown
			require("telescope").load_extension("ui-select")
			require("telescope").load_extension("fzf")
		end,
	},
	-- {
	-- 	"nvim-telescope/telescope-ui-select.nvim",
	-- },
}
