#!/usr/bin/env xonsh

from os.path import expanduser

wayfire = expanduser('~/.config/wayfire.ini')

import configparser

config = configparser.ConfigParser(); config.read(wayfire)

enabled = tuple(config['core']['plugins'].split())
for sect in config.sections():
    if sect not in ('core', 'input', 'input-device', 'output', 'workarounds') + enabled and not sect.startswith('output:'):
        config.remove_section(sect)

config.write(open(wayfire, 'w'))

configs = (
    wayfire,
    '~/.config/systemd/user',
    '~/.config/wpaperd',
    '~/.config/waybar',
    '~/.config/fuzzel',
    '/etc/greetd',
    '/etc/systemd/logind.conf',
    '/etc/pacman.conf',
    '/boot/limine.conf',
    '/etc/modprobe.d/',
    '/etc/NetworkManager/conf.d/wifi.conf',
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
    '~/.config/user-dirs.dirs',
    '~/.config/pipewire/pipewire.conf',
    '~/.config/xdg-desktop-portal-wlr',
    '~/.gtkrc-2.0',
    '~/.config/gtk-3.0',
    '~/.config/gtk-4.0',
    '~/build/wcm-0.10.0/src/wcm.cpp.diff',
    '~/build/pwvucontrol-0.5.3/data/resources/ui/window.blp.diff',
    '~/.wezterm.lua',
    '~/.config/fresh/config.json',
    '~/.local/share/nemo/actions',
    '~/wallpapers',
    '~/.config/xournalpp/settings.xml',
    '~/.config/xournalpp/toolbar.ini',
    '~/.config/MangoHud/MangoHud.conf',
    '~/.config/legendary/config.ini'
)

commands = (
    ('LIBVIRT_WIN11', 'virsh -c qemu:///system dumpxml win11'),
    ('GROUPS', 'groups'),
    ('PACKAGES', 'pacman -Qeq'),
    ('LOCAL', 'tree -L1 /usr/local/bin'),
    ('SYSTEMD', '(systemctl list-unit-files --state=masked,disabled,enabled --no-pager; systemctl list-unit-files --user --state=masked,disabled,enabled --no-pager) | grep -E "(disabled( +)enabled)|(enabled( +)disabled)|masked"'),
)

rm -rf synced
mkdir synced
cd synced

cp ../sync.xsh .

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
