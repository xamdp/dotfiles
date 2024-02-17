require("obsidian").setup({
	"epwalsh/obsidian.nvim",
	version = "latest",  -- recommended, use latest release instead of latest commit
	lazy = true,
	ft = "markdown",
	workspaces = {
		{
			name = "my_second_brain",
			path = "/home/diegs/Documents/my_second_brain",
		},
	},

	log_level = vim.log.levels.INFO,
	dependencies = {
		-- Required.
		"nvim-lua/plenary.nvim",
		-- see below for full list of optional dependencies 👇
	},
	completion = {
		preferred_link_style = "markdown",
		nvim_cmp = true,
		new_notes_location = "current_dir",
		min_chars = 2,
		prepend_note_id = true,
		prepend_note_path = false,
		use_path_only = false,
	},
	mappings = {
		-- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
		["gf"] = {
			action = function()
				return require("obsidian").util.gf_passthrough()
			end,
			opts = { noremap = false, expr = true, buffer = true },
		},
		-- Toggle check-boxes.
		vim.api.nvim_set_keymap('n', '<leader>ch', [[:lua require("obsidian").util.toggle_checkbox()<CR>]], { noremap = true, silent = true }),
		vim.api.nvim_set_keymap('n', '<leader>gb', [[:ObsidianFollowLink<CR>]], { noremap = true, silent = true }),
		-- ["<leader>ch"] = {
		-- 	action = function()
		-- 		return require("obsidian").util.toggle_checkbox()
		-- 	end,
		-- 	opts = { buffer = true },
		-- },
	},
	disable_frontmatter = false,
	-- Optional, alternatively you can customize the frontmatter data.
	-- note_frontmatter_func = function(note)
	-- 	-- This is equivalent to the default frontmatter function.
	-- 	local out = { id = note.id, aliases = note.aliases, tags = note.tags }
	-- 	-- `note.metadata` contains any manually added fields in the frontmatter.
	-- 	-- So here we just make sure those fields are kept in the frontmatter.
	-- 	if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
	-- 		for k, v in pairs(note.metadata) do
	-- 			out[k] = v
	-- 		end
	-- 	end
	-- 	return out
	-- end,
	-- Optional, for templates (see below).
	-- templates = {
	-- 	subdir = "templates",
	-- 	date_format = "%Y-%m-%d",
	-- 	time_format = "%H:%M",
	-- 	-- A map for custom variables, the key should be the variable and the value a function
	-- 	substitutions = {},
	-- },
	-- Optional, customize the backlinks interface.
	backlinks = {
		-- The default height of the backlinks pane.
		height = 10,
		-- Whether or not to wrap lines.
		wrap = true,
	},
	follow_url_func = function(url)
		-- Open the URL in the default web browser.
		-- vim.fn.jobstart({"open", url})  -- Mac OS
		vim.fn.jobstart({"xdg-open", url})  -- linux
	end,
	use_advanced_uri = false,
	finder = "telescope.nvim",
	sort_by = "modified",
	sort_reversed = true,
	open_notes_in = "current",
	-- Optional, configure additional syntax highlighting / extmarks.
	-- This requires you have `conceallevel` set to 1 or 2. See `:help conceallevel` for more details.
	ui = {
		enable = true,  -- set to false to disable all additional syntax features
		update_debounce = 200,  -- update delay after a text change (in milliseconds)
		-- Define how various check-boxes are displayed
		checkboxes = {
			-- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
			[" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
			["x"] = { char = "", hl_group = "ObsidianDone" },
			[">"] = { char = "", hl_group = "ObsidianRightArrow" },
			["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
			-- Replace the above with this if you don't have a patched font:
			-- [" "] = { char = "☐", hl_group = "ObsidianTodo" },
			-- ["x"] = { char = "✔", hl_group = "ObsidianDone" },

			-- You can also add more custom ones...
		},
		-- Use bullet marks for non-checkbox lists.
		bullets = { char = "•", hl_group = "ObsidianBullet" },
		external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
		-- Replace the above with this if you don't have a patched font:
		-- external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
		reference_text = { hl_group = "ObsidianRefText" },
		highlight_text = { hl_group = "ObsidianHighlightText" },
		tags = { hl_group = "ObsidianTag" },
		hl_groups = {
			-- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
			ObsidianTodo = { bold = true, fg = "#f78c6c" },
			ObsidianDone = { bold = true, fg = "#89ddff" },
			ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
			ObsidianTilde = { bold = true, fg = "#ff5370" },
			ObsidianBullet = { bold = true, fg = "#89ddff" },
			ObsidianRefText = { underline = true, fg = "#c792ea" },
			ObsidianExtLinkIcon = { fg = "#c792ea" },
			ObsidianTag = { italic = true, fg = "#89ddff" },
			ObsidianHighlightText = { bg = "#75662e" },
		},
	},
	-- Specify how to handle attachments.
	attachments = {
		-- The default folder to place images in via `:ObsidianPasteImg`.
		-- If this is a relative path it will be interpreted as relative to the vault root.
		-- You can always override this per image by passing a full path to the command instead of just a filename.
		img_folder = "Images",  -- This is the default
		-- A function that determines the text to insert in the note when pasting an image.
		-- It takes two arguments, the `obsidian.Client` and a plenary `Path` to the image file.
		-- This is the default implementation.
		---@param client obsidian.Client
		---@param path Path the absolute path to the image file
		---@return string
		img_text_func = function(client, path)
			local link_path
			local vault_relative_path = client:vault_relative_path(path)
			if vault_relative_path ~= nil then
				-- Use relative path if the image is saved in the vault dir.
				link_path = vault_relative_path
			else
				-- Otherwise use the absolute path.
				link_path = tostring(path)
			end
			local display_name = vim.fs.basename(link_path)
			return string.format("![%s](%s)", display_name, link_path)
		end,
	},
})
