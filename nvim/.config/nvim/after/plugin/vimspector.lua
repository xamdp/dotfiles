
-- vimspector human keymappings
vim.keymap.set('n', '<F5>', '<Plug>VimspectorContinue', { noremap = true, silent = true })
vim.keymap.set('n', '<F3>', '<Plug>VimspectorStop', { noremap = true, silent = true })
vim.keymap.set('n', '<F4>', '<Plug>VimspectorRestart', { noremap = true, silent = true })
vim.keymap.set('n', '<F6>', '<Plug>VimspectorPause', { noremap = true, silent = true })
vim.keymap.set('n', '<F9>', '<Plug>VimspectorToggleBreakpoint', { noremap = true, silent = true })
vim.keymap.set('n', '<leader><F9>', '<Plug>VimspectorToggleConditionalBreakpoint', { noremap = true, silent = true })
vim.keymap.set('n', '<F8>', '<Plug>VimspectorAddFunctionBreakpoint', { noremap = true, silent = true })
vim.keymap.set('n', '<F10>', '<Plug>VimspectorStepOver', { noremap = true, silent = true })
vim.keymap.set('n', '<F11>', '<Plug>VimspectorStepInto', { noremap = true, silent = true })
vim.keymap.set('n', '<F12>', '<Plug>VimspectorStepOut', { noremap = true, silent = true, desc = 'StepOut' })
