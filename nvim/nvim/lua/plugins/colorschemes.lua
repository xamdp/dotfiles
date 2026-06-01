return {
	"scottmckendry/cyberdream.nvim",
	name = "cyberdream",
	lazy = false,
	priority = 1000,
	config = function()
		require("cyberdream").setup({
			variant = "dark",
			transparent = false,
			saturation = 0.8,
			italic_comments = false,
			hide_fillchars = false,
			borderless_pickers = false,
			terminal_colors = true,
			cache = false,
			highlights = {
				comment = { fg = "#696969", bg = "NONE", italic = true },
			},
			extensions = {
				telescope = true,
				notify = true,
				mini = true,
				cmp = true,
			},
		})
		vim.cmd("colorscheme cyberdream")
	end,
}
