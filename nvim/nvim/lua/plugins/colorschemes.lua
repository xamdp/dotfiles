return {
	"vague2k/vague.nvim",
	lazy = false,
	enabled = true,
	priority = 1000,
	config = function()
		require("vague").setup({
			transparent = true,
			bold = true,
			italic = true,
		})
		vim.cmd("colorscheme vague")
	end,
}
