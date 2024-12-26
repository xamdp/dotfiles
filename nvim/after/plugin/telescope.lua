require('telescope').setup{
	defaults = {
		sorting_strategy = 'ascending',
		path_display = { "filename_first" },
		vimgrep_arguments = {
			'rg',
			'--color=never',
			'--no-heading',
			'--with-filename',
			'--line-number',
			'--column',
			'--smart-case',
			'--hidden',
			'--no-ignore',
		},
	},
	pickers = {
		find_files = {
			hidden = true,
			no_ignore = true,
			find_command = {
				'fd', '--type', 'f', '-H', '--strip-cwd-prefix',
			},
		},
	},
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>?', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
