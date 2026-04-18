local wezterm = require 'wezterm'

function hexToRGBA(hex, alpha)
	hex = hex:sub(2)

	return string.format("rgba(%d %d %d %.2f)", hex:sub(1,2), hex:sub(3,4), hex:sub(5,6), alpha)
end

local scheme = 'Derp (terminal.sexy)'
local opacity = 0.75

local scheme_colors = wezterm.color.get_builtin_schemes()[scheme]
local bg = hexToRGBA(scheme_colors.background, opacity)

return {
	color_scheme = scheme,
	window_background_opacity = opacity,
	font = wezterm.font 'FiraCode Nerd Font',

	use_fancy_tab_bar = false,
	show_new_tab_button_in_tab_bar = false,
	hide_tab_bar_if_only_one_tab = true,
	colors = {
		tab_bar = {
			background = bg,
			active_tab = {
				bg_color = bg,
				fg_color = scheme_colors.foreground,
				italic = true,
				intensity = 'Bold'
			},
			inactive_tab_hover = {
				bg_color = bg,
				fg_color = scheme_colors.foreground,
				italic = true,
			},
			inactive_tab = {
				bg_color = bg,
				fg_color = scheme_colors.foreground,
			},
		},
	},

	initial_cols = 125,
	initial_rows = 40,

	keys = {
		{
			key = 'c',
			mods = 'ALT',
			action = wezterm.action.CloseCurrentTab { confirm = true },
		},
		{
			key = 'z',
			mods = 'ALT',
			action = wezterm.action.SpawnTab 'CurrentPaneDomain',
		},
	},

	default_prog = {'bash', '-i'},
}
