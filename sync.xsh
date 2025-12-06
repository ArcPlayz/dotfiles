#!/usr/bin/env xonsh

configs = (
    "~/.config/wayfire.ini",
    "~/.config/waybar",
    "~/.config/fuzzel",
    "/etc/greetd",
    "~/.wezterm.lua",
    "~/.local/bin",
    "~/.config/fish/config.fish",
    "~/.bash_profile",
    "~/.bashrc",
    "~/.config/mimeapps.list",
    "/etc/pacman.conf",
    "/boot/limine.conf",
    "/etc/modprobe.d",
    "/etc/udev/rules.d",
    "/etc/systemd/logind.conf",
    "~/.config/pipewire/pipewire.conf",
    "~/.config/pragtical/init.lua",
    "~/.config/pragtical/user_settings.lua",
    "~/.gtkrc-2.0",
    "~/.config/gtk-3.0",
    "~/.config/Vencord/settings",
    "~/.config/spicetify/config-xpui.ini",
    "~/.local/share/nemo",
    "~/.config/xdg-desktop-portal-wlr",
)

commands = (
    ("DCONF", "dconf dump /"),
    ("PACKAGES", "pacman -Qeq; flatpak list; flatpak list --user"),
    ("SYSTEMD", "systemctl list-unit-files --state=masked,disabled,enabled --no-pager | grep -E '(disabled( +)enabled)|(enabled( +)disabled)|masked'"),
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
