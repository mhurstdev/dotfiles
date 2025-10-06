local wezterm = require("wezterm")

return {
	send_composed_key_when_left_alt_is_pressed = true,
	colors = {
		background = "#000000",
	},
	font = wezterm.font("TX-02"),
	font_size = 18,
	harfbuzz_features = {
		"calt=0",
		"clig=0",
		"liga=0",
	},
}
