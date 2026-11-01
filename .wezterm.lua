-- ~/.wezterm.lua — Warlock
local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Palette ------------------------------------------------------------------
local p = {
	bg_dark = "#15232f",
	bg = "#1f3347",
	bg_hl = "#2a4259",
	select = "#34506b",
	comment = "#5d7a92",
	fg = "#a9bccb",
	fg_bright = "#e6eef2",
	orange = "#f08a1c",
	yellow = "#d9a521",
}

config.colors = {
	foreground = p.fg,
	background = "#000000",
	cursor_bg = p.orange,
	cursor_fg = p.bg_dark,
	cursor_border = p.orange,
	selection_fg = p.fg_bright,
	selection_bg = p.select,
	scrollbar_thumb = p.select,
	split = p.bg_hl,
	compose_cursor = p.yellow,
	visual_bell = p.bg_hl,

	--          black      red        green      yellow     blue       magenta    cyan       white
	ansi = { "#15232f", "#d0382b", "#93a62b", "#d9a521", "#4a9ad8", "#c4588f", "#3fa8a0", "#a9bccb" },
	brights = { "#4a6378", "#e85a48", "#b3c64a", "#f0c350", "#78b8e8", "#e07fae", "#6cc7bf", "#e6eef2" },
}

-- Window -------------------------------------------------------------------
-- tmux draws the status bar, so WezTerm's tabs are off
config.enable_tab_bar = false

config.default_domain = "WSL:Ubuntu-26.04"

-- The orange strip down the left edge, like the film
config.window_frame = {
	border_left_width = "0.5cell",
	border_left_color = p.orange,
	border_right_width = 0,
	border_top_height = 0,
	border_bottom_height = 0,
}
config.window_padding = { left = "1cell", right = "1cell", top = "0.5cell", bottom = 0 }

-- Font (change to taste)
config.font = wezterm.font("ShureTechMono Nerd Font Mono")
-- config.font_size = 13

return config
