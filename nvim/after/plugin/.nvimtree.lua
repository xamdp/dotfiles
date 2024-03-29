-- local function my_on_attach(bufnr)
-- 	local api = require "nvim-tree.api"
--
-- 	local function opts(desc)
-- 		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
-- 	end
--
-- 	-- default mappings
-- 	api.config.mappings.default_on_attach(bufnr)
--
-- 	-- custom mappings
-- 	vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent, opts('Up'))
-- 	vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
-- 	vim.keymap.set('n', '<leader>pv', vim.cmd.NvimTreeToggle)
-- 	vim.keymap.set('n', '<leader>ff', vim.cmd.NvimTreeFindFileToggle)
-- 	vim.keymap.set('n', '<leader>ot', vim.cmd.NvimTreeOpen)
-- end
--
-- -- pass to setup along with your other options
-- require("nvim-tree").setup {
-- 	view = {
-- 		-- width = 35,
-- 		adaptive_size = true
-- 	},
-- 	---
-- 	on_attach = my_on_attach,
-- 	---
-- }
