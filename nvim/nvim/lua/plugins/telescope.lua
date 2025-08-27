return {
	'nvim-telescope/telescope.nvim',
	keys = {
		{"<leader>sf", "<cmd>Telescope find_files<cr>"},
		{"<leader>sg", "<cmd>Telescope live_grep<cr>"},
	},
	tag = '0.1.8',
	dependencies = { 'nvim-lua/plenary.nvim' }
}
