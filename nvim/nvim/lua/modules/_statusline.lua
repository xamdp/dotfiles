local fn = vim.fn
local api = vim.api
local M = {}

M.trunc_width = setmetatable({
	git_status	= 90,
	filename	= 140,
}, {
	__index = function()
		return 80
	end,
})

M.is_truncated =  function(_, width)
	local current_width = api.nvim_win_get_width(0)
	return current_width < width
end

M.colors = {
	active 			= '%#StatusLine#',
	inactive		= '%#StatusLineNC#',
	mode			= '%#StatusLineMode#',
	mode_alt		= '%#StatusLineModeAlt#',
	git 			= '%#StatusLineGit#',
	git_alt			= '%#StatusLineGitAlt#',
	filetype 		= '%#StatusLineFT#',
	filetype_alt	= '%#StatusLineFTAlt#',
	line_col		= '%#StatusLineLineCol#',
	line_col_alt	= '%#StatusLineLineColAlt#',
}

M.separators =  {
  arrow = { '', '' },
  rounded = { '', '' },
  blank = { '', '' },
}

local active_sep = 'blank'

M.modes = setmetatable({
	["n"] = "N",
	["no"] = "N·P",
	["v"] = "V",
	["V"] = "V·L",
	[""] = "V·B",
	["s"] = "S",
	["S"] = "S·L",
	[""] = "S·B",
	["i"] = "I",
	["ic"] = "I",
	["R"] = "R",
	["Rv"] = "V·R",
	["c"] = "C",
	["cv"] = "V·E",
	["ce"] = "E",
	["r"] = "P",
	["rm"] = "M",
	["r?"] = "C",
	["!"] = "S",
	["t"] = "T",
}, {
	__index = function()
		return "U" -- handle edge cases
	end,
})

M.get_current_mode =  function(self)
	local current_mode = api.nvim_get_mode().mode
	return string.format(" %s ", self.modes[current_mode]):upper()
	-- if self:is_truncated(self.trunc_width.mode) then
	-- 	return string.format(' %s ', modes[current_mode][2]):upper()
	-- end
	--
	-- return string.format(' %s ', modes[current_mode][1]):upper()
	--
end

M.get_git_status = function(self)
	local signs = vim.b.gitsigns_status_dict or {head = "", added = 0, changed = 0, removed = 0}
	local is_head_empty = signs.head ~= ""

	if self:is_truncated(self.trunc_width.git_status) then
		return is_head_empty and string.format('  %s ', signs.head or "") or ""
	end

	return is_head_empty
		and string.format(
			" +%s ~%s -%s |  %s ",
			signs.added, signs.changed, signs.removed, signs.head
		) or ""
end

M.get_filename =  function()
	local filename = fn.expand "%:t"
	if filename == "" then
		return ""
	end
	return filename
	-- if self:is_truncated(self.trunc_width.filename) then return " %<%f " end
	-- return " %<%F "
end

M.get_filetype = function()
	local file_name, file_ext = fn.expand "%:t", fn.expand "%:e"
	local icon = require'nvim-web-devicons'.get_icon(file_name, file_ext, { default =  true })
	local filetype = vim.bo.filetype

	if filetype == "" then return " No FT " end
	return string.format(" %s %s ", icon, filetype):lower()
end

M.get_line_col = function()
	-- if self:is_truncated(self.trunc_width.line_col) then return ' %1:%c ' end
	-- return ' Ln %1, Col %c '
	return " %l:%c "
end

M.get_lsp_diagnostic = function(self)
	local result = {}
	local levels = {
		errors = 'Error',
		warnings = 'Warning',
		info = 'Information',
		hints = 'Hint'
	}

	for k, level in pairs(levels) do
		result[k] = vim.lsp.diagnostic.get_count(0, level)
	end

	if self:is_truncated(self.trunc_width.diagnostic) then
		return ''
	else
		return string.format(
			"| :%s :%s :%s :%s ",
			result['errors'] or 0, result['warnings'] or 0,
			result['info'] or 0, result['hints'] or 0
		)
	end
end

M.set_active = function(self)
	local colors = self.colors
	local mode = colors.mode .. self:get_current_mode()
	local mode_alt = colors.mode_alt .. self.separators[active_sep][1]
	local git = colors.git .. self:get_git_status()
	local git_alt = colors.git_alt .. self.separators[active_sep][1]

	local filename = colors.inactive .. self:get_filename()

	local filetype_alt = colors.filetype_alt .. self.separators[active_sep][2]
	local filetype = colors.filetype .. self:get_filetype()
	local line_col = colors.line_col .. self:get_line_col()
	local line_col_alt = colors.line_col_alt .. self.separators[active_sep][2]

	return table.concat {
		colors.active, mode, mode_alt, line_col, line_col_alt,
		filename, "%=",
		filetype_alt, filetype, git, git_alt,
	}
end

M.set_inactive = function(self)
	return self.colors.inactive .. '%= %F %='
end

Statusline = setmetatable(M, {
	__call = function(self, mode)
		return self["set_" .. mode](self)
	end,
})

vim.cmd [[
	augroup Statusline
	au!
	au WinEnter,BufEnter * setlocal statusline=%!v:lua.Statusline('active')
	au WinLeave,BufLeave * setlocal statusline=%!v:lua.Statusline('inactive')
	augroup END
]]
