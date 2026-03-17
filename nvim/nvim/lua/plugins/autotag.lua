return {
	"windwp/nvim-ts-autotag",
	event = "InsertEnter",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	config = function()
		require("nvim-ts-autotag").setup({
			opts = {
				-- These are the important ones for JSX components
				enable_close = true, -- </div> when typing >
				enable_rename = true, -- rename opening tag → closing updates
				enable_close_on_slash = false, -- type / inside <Tag/ → auto <Tag />
			},
			-- Optional: make sure it knows about jsx
			filetypes = {
				"html",
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"jsx", -- sometimes needed
				"tsx",
			},
		})
	end,
}
