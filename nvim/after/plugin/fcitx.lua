local en = "keyboard-us"
local ja = "mozc"

require("fcitx5").setup({
	imname = {
		norm = en,
		ins = ja,
		cmd = en,
	},
	remember_prior = true,
	define_autocmd = true,
	autostart_fcitx5 = true,
	log = "warn",
})
