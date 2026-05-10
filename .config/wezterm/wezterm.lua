local wezterm = require "wezterm"

local config = wezterm.config_builder()

-- General
config.hide_tab_bar_if_only_one_tab = true
config.send_composed_key_when_left_alt_is_pressed = true

-- Background
--  config.background = {
-- 	{
-- 		source = {
-- 			File = os.getenv "HOME" .. "/dotfiles/.config/wezterm/background.jpg",
-- 		},
-- 		hsb = {
-- 			brightness = 0.075,
-- 		},
-- 	},
-- }
--
-- Font
config.font = wezterm.font "TX-02"
config.font_size = 20
config.harfbuzz_features = {
	"calt=0",
	"clig=0",
	"liga=0",
}

-- Colors
config.colors = {
	cursor_bg = "#f9e2af",
	cursor_fg = "#1e1e2e",
	cursor_border = "#f9e2af",
}

return config
