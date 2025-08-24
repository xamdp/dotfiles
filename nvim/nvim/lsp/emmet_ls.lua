local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

return {
	cmd = {
		"emmet-ls", "--stdio"
	},

	filetypes = {
		"astro", "css", "eruby", "html", "htmlangular", "htmldjango", "javascriptreact", "less",
		"pug", "sass", "scss", "svelte", "templ", "typescriptreact", "vue",
	},

	root_markers = {
		".git"
	},

	capabilities = capabilities,

	init_options = {
		html = {
			options = {
				["bem.enabled"] = true
			},
		},
	},
}
