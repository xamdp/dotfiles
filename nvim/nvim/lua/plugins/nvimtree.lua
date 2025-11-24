return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	keys = {
		{ "<leader>e", "<cmd>NvimTreeToggle<cr>" }
	},
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	options = {
		open_on_setup = false,
		open_on_tab = false,
	},
	config = function()
		require("nvim-tree").setup {}
	end,
}
