require "options"
require "plugins"

-- require "modules._appearances"
-- require "modules._statusline"

vim.o.shell = "/bin/zsh"

vim.g.python3_host_prog = '~/.pyenv/shims/python3'

-- vimspector options
vim.g.vimspector_enable_mappings = 'HUMAN'
vim.g.vimspector_install_gadgets = {
	'vscode-node',
	'vscode-js-debug',
	'debugger-for-chrome',
	'vscode-firefox-debug',
	'local-lua-debugger-vscode',
	'CodeLLDB',
	'vscode-cpptools',
}

