local dap = require('dap')
-- require('telescope').load_extension('dap')

dap.adapters.php = {
  type = 'executable',
  command = 'node',
  args = { '/home/diegs/opt/vscode-php-debug/out/phpDebug.js' }
}

dap.configurations.php = {
	{
		type = 'php',
		request = 'launch',
		name = 'Listen for Xdebug',
		port = 9000,
		environmet = {
			XDEBUG_SESSION = '1'
		},
		idekey = 'NVIM'
	}
}
