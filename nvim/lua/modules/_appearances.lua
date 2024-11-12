local set_hl = function(group, options)
	local bg = options.bg == nil and '' or 'guibg=' .. options.bg
	local fg = options.fg == nil and '' or 'guifg=' .. options.fg
	local gui = options.gui == nil and '' or 'gui=' .. options.gui

	vim.cmd(string.format('hi %s %s %s %s', group, bg, fg, gui))
end

local highlights = {
	{'StatusLine', { fg = '#3C3836', bf = '#EBDBB2' }},
	{'StatusLineNC', { fg = '#3C3836', bf = '#928374' }},
	{'StatusLineMode', { bg = '#928374', fg = '#1D2021', gui="bold" }},
	{'StatusLineLineCol', { bg = '#928374', fg = '#1D2021', gui="bold" }},
	{'StatusLineGit', { bg = '#504945', fg = '#EBDBB2' }},
	{'StatusLineFT', { bg = '#504945', fg = '#EBDBB2' }},
	{'StatusLineFilename', { bg = '#504945', fg = '#EBDBB2' }},
	{'StatusLineModeAlt', { bg = '#504945', fg = '#928374' }},
	{'StatusLineGitAlt', { bg = '#3C3836', fg = '#504945' }},
	{'StatusLineLineColAlt', { bg = '#504945', fg = '#928374' }},
	{'StatusLineFTAlt', { bg = '#3C3836', fg = '#504945' }},
}

for _, highlight in ipairs(highlights) do
	set_hl(highlight[1], highlight[2])
end
