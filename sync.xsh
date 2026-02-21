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
	'/etc/modprobe.d',
	'/etc/udev/rules.d',
	'/etc/modules-load.d',
	'/etc/libvirt/qemu.conf',
	'/etc/nsswitch.conf',
	'/etc/systemd/resolved.conf',
	'/etc/exports',
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
	'~/build/wcm-0.10.0/src/wcm.cpp.diff',
	'~/build/pwvucontrol-0.5.1/data/resources/ui/window.ui.diff',
	'~/.wezterm.lua',
	'~/.local/share/nemo/actions',
	'~/.config/pragtical/init.lua',
	'~/.config/pragtical/user_settings.lua',
	'~/wallpapers',
)

commands = (
	('GROUPS', 'groups'),
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

for root in ('com/github/wwmm/easyeffects', 'org/cinnamon/desktop/privacy', 'org/gnome/desktop/interface', 'org/nemo', 'org/mate/engrampa/ui'):
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

mkdir -p etc/libvirt/qemu
cp /etc/libvirt/qemu/win11.xml etc/libvirt/qemu
