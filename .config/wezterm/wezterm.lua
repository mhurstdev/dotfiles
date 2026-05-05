local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.send_composed_key_when_left_alt_is_pressed = true
config.font = wezterm.font("TX-02")
config.font_size = 20
config.harfbuzz_features = {
	"calt=0",
	"clig=0",
	"liga=0",
}

return config
