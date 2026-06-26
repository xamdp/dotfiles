return {
	"rmagatti/auto-session",
	lazy = false,

	---enables autocomplete for opts
	---@module "auto-session"
	---@type AutoSession.Config
	keys = {
		{ "<leader>wr", "<cmd>AutoSession search<CR>", desc = "Session search" },
		{ "<leader>ws", "<cmd>AutoSession save<CR>", desc = "Save session" },
		{ "<leader>wa", "<cmd>AutoSession toggle<CR>", desc = "Toggle autosave" },
	},
	opts = {
		suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
		-- log_level = "debug",
		-- bypass_save_filetypes = { "terminal", "toggleterm" },
		preserve_buffer_on_restore = nil,
		-- close_filetypes_on_save = { "terminal", "toggleterm", "qf" },
		session_lens = {
			picker = "fzf",
			mappings = {
				delete_session = { "i", "<C-d>" },
				alternate_session = { "i", "<C-s>" },
				copy_session = { "i", "<C-y>" },
			},
			picker_opts = {
				height = 0.8,
				width = 0.50,
			},
		},
	},
}
