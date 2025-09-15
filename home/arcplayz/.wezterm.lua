local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.keys = {
	{
		key = 'c',
		mods = 'ALT',
		action = wezterm.action.CloseCurrentTab { confirm = false },
	},
	{
		key = 'z',
		mods = 'ALT',
		action = wezterm.action.SpawnTab 'CurrentPaneDomain',
	},
	{
		key = 'z',
		mods = 'ALT',
		action = wezterm.action.SpawnTab 'CurrentPaneDomain',
	}
}

config.window_frame = {
	font = wezterm.font { family = 'MonaspiceKr Nerd Font', weight = 'Bold'},

	font_size = 10.0,

	active_titlebar_bg = '#222222',
	inactive_titlebar_bg = '#222222',
}

config.default_prog = {'fish'}

config.color_scheme = 'Derp (terminal.sexy)'
config.font = wezterm.font 'FiraCode Nerd Font'
config.window_background_opacity = 0.75

return config
