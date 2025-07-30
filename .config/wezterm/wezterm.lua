local wezterm = require("wezterm")

return {
	send_composed_key_when_left_alt_is_pressed = true,
	font = wezterm.font("IosevkaTerm NF"),
	font_size = 18,
	window_background_opacity = 0.875,
	harfbuzz_features = {
		"calt=0",
		"clig=0",
		"liga=0",
	},
}
