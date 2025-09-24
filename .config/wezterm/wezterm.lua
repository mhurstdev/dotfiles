local wezterm = require("wezterm")

return {
	send_composed_key_when_left_alt_is_pressed = true,
	color_scheme = "Batman",
	colors = {
		background = "#000000",
	},
	font = wezterm.font("0xProto Nerd Font Mono"),
	font_size = 18,
	harfbuzz_features = {
		"calt=0",
		"clig=0",
		"liga=0",
	},
}
