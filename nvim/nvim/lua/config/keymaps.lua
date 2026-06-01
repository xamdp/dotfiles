local builtin = require("telescope.builtin")
-- vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })

-- similar to whichhey
vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })

-- remap jj to enter normal mode, when in term
vim.keymap.set("t", "jj", [[<C-\><C-n>]], { desc = "Exit terminal mode" })

-- vim explore, netrw
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
-- undotree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- switching focus
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- keybing for :w
vim.api.nvim_set_keymap("n", "<S-Z>S", ":w<CR>", { noremap = true, silent = true }) -- when in normal mode and as non-root user.

-- sudavim
vim.api.nvim_set_keymap("n", "<S-Z>W", ":SudaWrite<CR>", { noremap = true, silent = true }) -- when in normal mode and as root user, / suda.vim

-- screenkey
-- local function toggleScreenkey()
-- 	vim.cmd("Screenkey toggle")
-- end
--
-- vim.keymap.set("n", "<leader>ts", toggleScreenkey, { desc = "[T]oggle [S]creenkey" })

-- run mooc.fi current java exercise main class
vim.keymap.set("n", "<leader>rr", function()
	local class_name = vim.fn.expand("%:t:r") -- e.g. "Story"
	local root_dir = vim.fs.root(0, { "pom.xml", "mvnw", "gradlew", ".git" }) or vim.fn.getcwd()

	local cmd =
		string.format("cd %s && mvn compile -q && java -cp target/classes %s", vim.fn.shellescape(root_dir), class_name)
	vim.cmd("terminal " .. cmd)
end, { desc = "[R]un MOOC Java exercise" })

-- run mooc.fi current java exercise tests
vim.keymap.set("n", "<leader>rt", function()
	local root_dir = vim.fs.root(0, { "pom.xml" }) or vim.fn.getcwd()
	local cmd = string.format("cd %s && mvn test", vim.fn.shellescape(root_dir))
	vim.cmd("terminal " .. cmd)
end, { desc = "[T]est current exercise" })
