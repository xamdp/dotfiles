return {
	'nvim-lualine/lualine.nvim',
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require('lualine').setup {
			options = {
				icons_enabled = true,
				theme = 'auto',
				component_separators = { left = '', right = ''},
				section_separators = { left = '', right = ''},
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				}
			}
		}
	end,
}


