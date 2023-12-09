
vim.api.nvim_set_keymap('n', '<leader>1', '<cmd>lua require("bufferline").go_to(1, true)<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>2', '<cmd>lua require("bufferline").go_to(2, true)<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>3', '<cmd>lua require("bufferline").go_to(3, true)<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>4', '<cmd>lua require("bufferline").go_to(4, true)<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>5', '<cmd>lua require("bufferline").go_to(5, true)<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>6', '<cmd>lua require("bufferline").go_to(6, true)<cr>', {})

vim.api.nvim_set_keymap('n', '[b', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'b]', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })
