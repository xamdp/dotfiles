return {
	"ellisonleao/gruvbox.nvim",
	name = "gruvbox",
	priority = 1000,
	config = function()
		require("gruvbox").setup({
			contrast = "hard",
			transparent_mode = true,
			italic = {
				strings = false,
				comments = true,
				operators = false,
				folds = true,
			},
		})
		vim.cmd("colorscheme gruvbox")
	end,
}
