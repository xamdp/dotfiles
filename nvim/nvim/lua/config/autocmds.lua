vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
	callback = function(event)
		local map = function(keys, func, desc)
			vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
		end

		-- Telescope-powered LSP mappings (exactly what you asked for)
		map("gd", function()
			require("telescope.builtin").lsp_definitions()
		end, "Goto Definition")
		map("gr", function()
			require("telescope.builtin").lsp_references()
		end, "Goto References")
		map("gi", function()
			require("telescope.builtin").lsp_implementations()
		end, "Goto Implementation")
		map("gt", function()
			require("telescope.builtin").lsp_type_definitions()
		end, "Goto Type Definition")

		-- Declaration only when the server supports it (no more error in JS/TS files)
		local client = vim.lsp.get_client_by_id(event.data.client_id)

		-- <<< THIS IS THE ORIGINAL FUNCTION YOU ALREADY HAD >>>
		local client_supports_method = function(client, method, bufnr)
			if vim.fn.has("nvim-0.11") == 1 then
				return client:supports_method(method, bufnr)
			else
				return client:supports_method(method, { bufnr = bufnr })
			end
		end

		if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_declaration, event.buf) then
			map("gD", vim.lsp.buf.declaration, "Goto Declaration")
		end

		-- Rest of your mappings
		map("<leader>la", vim.lsp.buf.code_action, "Code Action")
		map("<leader>lr", vim.lsp.buf.rename, "Rename all references")
		map("<leader>lf", vim.lsp.buf.format, "Format")
		map("<leader>ss", function()
			require("telescope.builtin").lsp_document_symbols()
		end, "Document Symbols")
		map("<leader>v", "<cmd>vsplit | lua vim.lsp.buf.definition()<cr>", "Goto Definition in Vertical Split")
		map("K", vim.lsp.buf.hover, "Hover Documentation")
		map("gs", vim.lsp.buf.signature_help, "Signature Documentation")

		-- === Your original highlight logic (now using the correct function) ===
		if
			client
			and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf)
		then
			local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })

			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.document_highlight,
			})
			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.clear_references,
			})

			vim.api.nvim_create_autocmd("LspDetach", {
				group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
				callback = function(event2)
					vim.lsp.buf.clear_references()
					vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event2.buf })
				end,
			})
		end
	end,
})
