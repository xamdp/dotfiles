vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.mouse = "a"
vim.opt.showmode = false
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 300
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = false
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.inccommand = "split"
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.winborder = "solid" -- https://neovim.io/doc/user/options.html#'winborder'cmd.Ex)
vim.opt.termguicolors = true
vim.o.termguicolors = true

vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.o.foldcolumn = "1"
vim.o.foldenable = true
vim.o.foldlevel = 99
vim.o.foldnestmax = 3
-- vim.o.clipboard = 'unnamedplus'

-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

vim.g.netrw_keepdir = 0
vim.cmd([[let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro']])

vim.diagnostic.config({
	virtual_lines = false,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	-- float = {
	-- 	border = "rounded",
	-- 	source = true,
	-- },
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "󰅚 ",
			[vim.diagnostic.severity.WARN] = "󰀪 ",
			[vim.diagnostic.severity.INFO] = "󰋽 ",
			[vim.diagnostic.severity.HINT] = "󰌶 ",
		},
		numhl = {
			[vim.diagnostic.severity.ERROR] = "ErrorMsg",
			[vim.diagnostic.severity.WARN] = "WarningMsg",
		},
	},
})

vim.filetype.add({
	extension = {
		["http"] = "http",
	},
})
