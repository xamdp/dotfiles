-- Import the notify module
local notify = require("notify")

-- Set up the configuration using the provided table
notify.setup({
	notify._config(),
    background_colour = "#000000",
    fps = 30,
    icons = {
        DEBUG = "",
        ERROR = "",
        INFO = "",
        TRACE = "✎",
        WARN = ""
    },
    level = 2,
    minimum_width = 50,
    render = "default",
    stages = "fade_in_slide_out",
    time_formats = {
        notification = "%T",
        notification_history = "%FT%T"
    },
    timeout = 2000,
    top_down = true
})


notify("Welcome xamdp! Happy Coding!")
