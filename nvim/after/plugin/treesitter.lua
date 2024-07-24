require'nvim-treesitter.parsers'.get_parser_configs().blade = {
	install_info = {
		url = "https://github.com/EmranMR/tree-sitter-blade",
		files = {"src/parser.c"},
		branch = "main",
	},
	filetype = "blade",
}

require('nvim-treesitter.configs').setup {
	ensure_installed = {
		'lua',
		'vim',
		'c',
		'javascript',
		'vue',
		'css',
		'html',
		'sql',
		'php',
		'vimdoc',
		'java',
		'blade',
		'python'
	},
	auto_install = false,
	sync_install = true,
	ignore_install = {},
	modules = {
		auto_install = true,
		highlight = {
			enable = true,
			disable = {},
		},
	},
	indent = { enable = true},
}
