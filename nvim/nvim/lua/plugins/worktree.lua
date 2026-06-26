return {
	"Juksuu/worktrees.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim", "folke/snacks.nvim" },
	config = function()
		require("worktrees").setup({
			log_level = vim.log.levels.WARN,
			log_status = true,
			worktree_path = "..",
			switch_file_command = nil,
		})
	end,
}
