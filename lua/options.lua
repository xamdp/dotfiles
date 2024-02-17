vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.o.clipboard = 'unnamedplus'

vim.o.number = true

vim.o.relativenumber = true

vim.o.signcolumn = 'yes'

vim.o.tabstop = 4
vim.o.shiftwidth = 4

vim.o.updatetime = 300

vim.o.termguicolors = true
vim.opt.termguicolors = true

vim.o.mouse = 'a'

-- disable netrw
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

------------------------------------------------------------------------
local o = vim.opt

o.colorcolumn = nil
--
-- Line numbers etc in Netrw
vim.cmd([[let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro']])
------------------------------------------------------------------------

vim.api.nvim_set_keymap('n', '<S-Z>S', ':w<CR>', { noremap = true, silent = true})	-- when in normal mode and as non-root user.
vim.api.nvim_set_keymap('n', '<S-Z>W', ':SudaWrite<CR>', { noremap = true, silent = true})	-- when in normal mode and as root user, / suda.vim
