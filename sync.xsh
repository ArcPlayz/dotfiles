#!/usr/bin/env xonsh

configs = (
	'~/.config/wayfire.ini',
	'~/.config/wpaperd',
	'~/.config/waybar',
	'~/.config/fuzzel',
	'/etc/greetd',
	'/etc/systemd/logind.conf',
	'/etc/pacman.conf',
	'/boot/limine.conf',
	# '/etc/modprobe.d',
	# '/etc/udev/rules.d',
	'~/.local/bin',
	'~/.config/fish/config.fish',
	'~/.bash_profile',
	'~/.bashrc',
	'~/.config/mimeapps.list',
	'~/.config/pipewire/pipewire.conf',
	'~/.config/xdg-desktop-portal-wlr',
	'~/.gtkrc-2.0',
	'~/.config/gtk-3.0',
	'~/.config/gtk-4.0',
	'~/wcm-0.10.0/src/wcm.cpp.diff',
	'~/pwvucontrol-0.5.1/data/resources/ui/window.ui.diff',
	'~/.wezterm.lua',
	'~/.local/share/nemo/actions',
	'~/.config/pragtical/init.lua',
	'~/.config/pragtical/user_settings.lua',
	'~/.config/Vencord/settings',
	'~/.config/spicetify/config-xpui.ini',
	'~/.config/spicetify/Themes',
)

commands = (
	('PACKAGES', 'pacman -Qeq; flatpak list; flatpak list --user'),
	('LOCAL', 'tree -L2 /usr/local'),
	('SYSTEMD', 'systemctl list-unit-files --state=masked,disabled,enabled --no-pager | grep -E "(disabled( +)enabled)|(enabled( +)disabled)|masked"'),
	('PRAGTICAL_PLUGINS', """/usr/share/pragtical/plugins/plugin_manager/ppm.x86_64-linux list --json | jq -r '.[][] | select(.status=="installed") | .id'"""),
)

rm -rf synced
mkdir synced
cd synced

cp ../sync.xsh .

from os.path import expanduser

for path in configs:
	cp -r --parents @(expanduser(path)) .

mkdir commands
for name, command in commands:
	bash -c @(command) > @('commands/' + name)

for root in ('com/github/wwmm/easyeffects', 'org/cinnamon/desktop/privacy', 'org/gnome/desktop/interface', 'org/nemo'):
	tree = []
	for line in $(dconf dump @('/' + root + '/')).splitlines():
		if line and (line[0], line[-1]) == ('[', ']'):
			path = line[1:-1]
			tree.append(
				'[' + (root if path == '/' else (root + '/' + path)) + ']'
			)
		else:
			tree.append(line)
	echo @('\n'.join(tree) + '\n') >> commands/DCONF
