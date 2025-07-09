local util = require('lspconfig.util')

local on_attach = function(_, bufnr)

	local bufmap = function(keys, func)
		vim.keymap.set('n', keys, func, { buffer = bufnr })
	end

	bufmap('<space>rn', vim.lsp.buf.rename)
	bufmap('gd', vim.lsp.buf.definition)
	bufmap('gD', vim.lsp.buf.declaration)
	bufmap('gI', vim.lsp.buf.implementation)
	bufmap('<leader>D', vim.lsp.buf.type_definition)

	bufmap('<C-k>', vim.lsp.buf.signature_help)
	bufmap('<space>wa', vim.lsp.buf.add_workspace_folder)
	bufmap('<space>wr', vim.lsp.buf.remove_workspace_folder)

	bufmap('gr', require('telescope.builtin').lsp_references)
	bufmap('<space>s', require('telescope.builtin').lsp_document_symbols)
	bufmap('<leader>S', require('telescope.builtin').lsp_dynamic_workspace_symbols)

	bufmap('<space>wl', function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end)

	bufmap('<space>ca', vim.lsp.buf.code_action)
	bufmap('K', vim.lsp.buf.hover)

	bufmap('<space>e', vim.diagnostic.open_float)
	bufmap('[d', vim.diagnostic.goto_prev) bufmap(']d', vim.diagnostic.goto_next)
	bufmap('<space>q', vim.diagnostic.setloclist)

	vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
		vim.lsp.buf.format()
		end, {})
end


local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- mason
require("mason").setup()
require("mason-lspconfig").setup({

	function(server_name)
		require("lspconfig")[server_name].setup {
			on_attach = on_attach,
			capabilities = capabilities
		}
	end,

	["lua_ls"] = function()
		require('neodev').setup()
		require('lspconfig').lua_ls.setup {
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {
				Lua = {
					workspace = { checkThirdParty = false },
					telemetry = { enable = false },
				},
			}
		}
	end,


	['phpactor'] = function()
		require('lspconfig').phpactor.setup {
			on_attach = on_attach,
			capabilities = capabilities,
			cmd = { 'phpactor', 'language-server', '-vvv' },
			filetypes = { 'php' },
			-- root_dir = function(pattern)
			-- 	local cwd = vim.loop.cwd()
			-- 	local root = util.root_pattern('composer.json', '.git', '.phpactor.json', '.phpactor.yml')(pattern)
			--
			-- 	-- prefer cwd if root is a descendant
			-- 	return util.path.is_descendant(cwd, root) and cwd or root
			-- end,
			root_dir = util.root_pattern("composer.json", ".git"),
			-- root_dir = function()
			-- 	return vim.fn.expand('%:p:h')
			-- end,
		}
	end,



	['sqlls'] = function()
		require('lspconfig').sqlls.setup {
			capabilities = capabilities,
			filetypes = { 'sql', 'mysql', 'sqlite' },
			root_dir = function(_)
				return vim.loop.cwd()
			end,
		}
	end,
})

vim.cmd([[
augroup PhpactorCache
	autocmd!
	autocmd BufWritePost *.php silent! !phpactor cache:clear
augroup END
]])
