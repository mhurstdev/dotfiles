local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_schemes = { ['war10ck'] = require("colors.war10ck") }
config.color_scheme = "war10ck"
config.send_composed_key_when_left_alt_is_pressed = true
config.font = wezterm.font("FiraMono Nerd Font")
config.font_size = 20
config.harfbuzz_features = {
	"calt=0",
	"clig=0",
	"liga=0",
}

return config
