return {
	"coder/claudecode.nvim",
	dependencies = { "folke/snacks.nvim" },
	opts = {
		port_range = { min = 10000, max = 65535 },
		auto_start = true,
		log_level = "info",
		terminal_cmd = "ANTHROPIC_AUTH_TOKEN='freeclaudecode' ANTHROPIC_BASE_URL='http://localhost:8082' claude",
	},
	config = true,
	keys = {
		{ "<leader>c", nil, desc = "AI/Claude Code" },
		{ "<leader>ca", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
		{ "<leader>cf", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
		{ "<leader>cr", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
		{ "<leader>cC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
		{ "<leader>cm", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
		{ "<leader>cb", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
		{ "<leader>cs", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
		{
			"<leader>as",
			"<cmd>ClaudeCodeTreeAdd<cr>",
			desc = "Add file",
			ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw" },
		},
		-- Diff management
		{ "<leader>cc", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
		{ "<leader>cd", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
	},
}
