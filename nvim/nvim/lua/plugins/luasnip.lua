return {
	"L3MON4D3/LuaSnip",
	version = "v2.*",
	build = "make install_jsregexp",

	event = "InsertEnter",
	dependencies = { "rafamadriz/friendly-snippets" },

	config = function()
		local luasnip = require("luasnip")

		-- Load friendly snippets (HTML ones work inside JSX)
		luasnip.filetype_extend("javascriptreact", { "html" })
		-- Optional: also add for typescriptreact if you ever switch to .tsx
		luasnip.filetype_extend("typescriptreact", { "html" })

		require("luasnip.loaders.from_vscode").lazy_load()

		-- === Self-closing JSX component: <Spinner/ → <Spinner /> instantly ===
		-- Trigger: any word characters followed by '/' inside what looks like a tag
		-- IMPORTANT: you need to type the opening < first, e.g. <Spinner/
		local s = luasnip.snippet
		local fmt = require("luasnip.extras.fmt").fmt

		luasnip.add_snippets("javascriptreact", {
			s(
				{
					trig = "<(%w+)/", -- matches < followed by word chars then /
					regTrig = true,
					wordTrig = false,
					snippetType = "autosnippet",
					priority = 2000, -- higher than most defaults so it wins
				},
				fmt("<{} />", { luasnip.f(1, function(_, snip)
					return snip.captures[1]
				end) })
			),
		})

		-- MUST be enabled for autosnippets to expand without pressing a key
		luasnip.config.setup({
			enable_autosnippets = true,
			-- Helps cleanup if you delete/backspace away from the snippet
			region_check_events = { "InsertEnter", "CursorMoved" },
			delete_check_events = "TextChanged",
		})
	end,
}
