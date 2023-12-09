require("bufferline").setup{}

local bufferline = require('bufferline')
bufferline.setup {
	options = {
		mode = "buffers",
		style_preset = {
			bufferline.style_preset.no_italic,
		},
		themable = true,
		numbers = "ordinal",
		indicator = {
			icon = '| ',
			style = 'icon'
		},
		buffer_close_icon = 'x',
		modified_icon = '●',
		close_icon = '',
		left_trunc_marker = '',
		right_trunc_marker = '',
		max_name_length = 14,
		max_prefix_length = 15,
		truncate_names = false,
		tab_size = 15,
		diagnostics = 'nvim_lsp',
		diagnostics_update_in_insert = true,
		diagnostics_indicator = function(count, level)
			local icon = level:match("error") and " " or ""
			return " " .. icon .. count
		end,
		offsets = {
			{
				filetype = "NvimTree",
				text = "Yggdrasil",
				tex_align = "center",
				separator = true
			}
		},
		color_icons = true,
		show_buffer_icons = true,
		show_buffer_close_icons = true,
		show_close_icon = true,
		show_tab_indicators = true,
		show_duplicate_prefix = true,
		persist_buffer_sort = true,
		separator_style = {"|", "|"},
		enforce_regular_tabs = false,
		always_show_bufferline = true,
		hover = {
			enabled = true,
			delay = 200,
			reveal = {'close'}
		},
		sort_by = 'insert_after_current',
	}
}



