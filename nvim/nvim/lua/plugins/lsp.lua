return {
	{
		"mason-org/mason.nvim",
		dependencies = {
			"mason-org/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
			"artemave/workspace-diagnostics.nvim",
		},
		opts = {
			servers = {
				lua_ls = {
					settings = {
						Lua = {
							runtime = {
								version = "LuaJIT",
							},
							diagnostics = {
								globals = { "vim" },
								disable = { "missing-fields" },
							},
							workspace = {
								library = vim.api.nvim_get_runtime_file("", true),
								checkThirdParty = false,
							},
							telemetry = { enable = false },
						},
					},
				},
				ts_ls = {
					on_attach = function(client, bufnr)
						require("workspace-diagnostics").populate_workspace_diagnostics(client, bufnr)
					end,
				},
				eslint = {
					on_attach = function(client, bufnr)
						require("workspace-diagnostics").populate_workspace_diagnostics(client, bufnr)
					end,
				},
				tailwindcss = {
					on_attach = function(client, bufnr)
						require("workspace-diagnostics").populate_workspace_diagnostics(client, bufnr)
					end,
				},
				emmet_language_server = {
					on_attach = function(client, bufnr)
						require("workspace-diagnostics").populate_workspace_diagnostics(client, bufnr)
					end,
					filetypes = {
						"css",
						"eruby",
						"html",
						"javascript",
						"javascriptreact",
						"less",
						"sass",
						"scss",
						"pug",
						"typescriptreact",
					},
					init_options = {
						--- @type table<string, any> https://docs.emmet.io/customization/preferences/
						preferences = {},
						--- @type "always" | "never" Defaults to `"always"`
						showExpandedAbbreviation = "always",
						--- @type boolean Defaults to `true`
						showAbbreviationSuggestions = true,
						--- @type boolean Defaults to `false`
						showSuggestionsAsSnippets = false,
						--- @type table<string, any> https://docs.emmet.io/customization/syntax-profiles/
						syntaxProfiles = {},
						--- @type table<string, string> https://docs.emmet.io/customization/snippets/#variables
						variables = {},
						--- @type string[]
						excludeLanguages = {},
					},
				},
				clangd = {
					cmd = {
						"clangd",
						"--compile-commands-dir=" .. vim.fn.getcwd(),
					},
				},
			},
		},

		config = function(_, opts)
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"clangd",
					"lua_ls",
					"ts_ls",
					"eslint",
					"phpactor",
					"emmet_language_server",
					"jdtls",
				},
				automatic_enable = {
					exclude = { "jdtls" },
				},
			})

			-- local lspconfig = require("lspconfig")

			for server, config in pairs(opts.servers) do
				vim.lsp.config(server, config)
				-- lspconfig[server].setup(config)
				-- vim.lsp.enable(server)
			end
		end,
	},
	{ "mfussenegger/nvim-jdtls" },
}
