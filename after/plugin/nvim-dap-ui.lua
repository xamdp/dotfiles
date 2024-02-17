-- https://github.com/rcarriga/nvim-dap-ui
local dap = require("dap")
local dapui = require("dapui")
-- 初始化调试界面
dapui.setup(
	{
		layouts = {
			{
				elements = {
					-- Elements can be strings or table with id and size keys.
					{ id = "scopes", size = 0.70 }, -- 0.25
					{id = "breakpoints", size = 0.10 },
					{id = "stacks", size = 0.20 },
					{id = "watches", size = 0.20 },
				},
				size = 37, -- 40 columns
				position = "right",
			},
			{
				elements = {
					{id = "repl", size = 0.5},
					{id = "console", size = 0.5},
				},
				size = 0.20, -- 25% of total lines .20
				position = "bottom",
			},
		},
		controls = {
			-- Requires Neovim nightly (or 0.8 when released)
			enabled = true,
			-- Display controls in this element
			element = "repl",
			icons = {
				disconnect = "",
				pause = "",
				play = "",
				run_last = "",
				step_back = "",
				step_into = "",
				step_out = "",
				step_over = "",
				terminate = ""
			},
		},
		floating = {
			max_height = nil, -- These can be integers or a float between 0 and 1.
			max_width = nil, -- Floats will be treated as percentage of your screen.
			border = "rounded", -- Border style. Can be "single", "double" or "rounded"
			mappings = {
				close = { "q", "<Esc>" },
			},
		},
		windows = { indent = 1 },
		render = {
			max_type_length = nil, -- Can be integer or nil.
			max_value_lines = 100, -- Can be integer or nil.
		}
	}
)
-- 如果开启或关闭调试，则自动打开或关闭调试界面
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
	dap.repl.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
	dap.repl.close()
end
local function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
-- 显示或隐藏调试界面
map("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<CR>", {})
