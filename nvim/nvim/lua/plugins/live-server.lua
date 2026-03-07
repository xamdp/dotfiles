return {
	"barrettruth/live-server.nvim",
	build = "npm install -g live-server",
	cmd = { "LiveServerStart", "LiveServerStop" },
	config = function()
		vim.g.live_server = {
			port = 7000,
			browser = "chromium",
			verbose = true,
			root = vim.fn.getcwd(),
		}
	end,
	keys = {
		{
			"<leader>ls",
			"<cmd>LiveServerStart<cr>",
			desc = "Start Live Server",
		},
		{
			"<leader>lx",
			"<cmd>LiveServerStop<cr>",
			desc = "Stop Live Server",
		},
	},
}
