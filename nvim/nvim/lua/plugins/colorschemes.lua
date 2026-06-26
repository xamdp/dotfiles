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

			-- Override a highlight group entirely using the built-in colour palette
			overrides = function(colors) -- NOTE: This function nullifies the `highlights` option
				-- Example:
				return {
					Comment = { fg = colors.green, bg = "NONE", italic = true },
					["@property"] = { fg = colors.magenta, bold = true },
				}
			end,

			-- Override colors
			colors = {
				-- For a list of colors see `lua/cyberdream/colours.lua`

				-- Override colors for both light and dark variants
				bg = "#000000",
				green = "#00ff00",

				-- If you want to override colors for light or dark variants only, use the following format:
				dark = {
					magenta = "#ff00ff",
					fg = "#eeeeee",
				},
				light = {
					red = "#ff5c57",
					cyan = "#5ef1ff",
				},
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
