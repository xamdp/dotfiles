-- nvim/after/plugin/treesitter.lua 
-- local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
-- parser_config.lox = {
--   install_info = {
--     url = "/home/diegs/.config/nvim/lua/tree-sitter-lox", -- local path or git repo
--     files = {"src/parser.c",}, -- note that some parsers also require src/scanner.c or src/scanner.cc
--     -- optional entries:
--     -- branch = "main", -- default branch in case of git repo if different from master
--     -- generate_requires_npm = false, -- if stand-alone parser without npm dependencies
--     -- requires_generate_from_grammar = true, -- if folder contains pre-generated src/parser.c
--   },
-- }

require('nvim-treesitter.configs').setup {
	ensure_installed = { 'vim', 'vimdoc', 'lua', 'cpp', 'c', 'java', 'html', 'css', 'php' },
	auto_install = true,
	highlight = { enable = true },
	indent = { enable = true},

}
