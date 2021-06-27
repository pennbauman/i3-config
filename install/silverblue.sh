#!/bin/bash
# General Fedora Installs

message() {
	echo -e "\033[1;32m$1\033[0m"
}

loc="$(dirname $BASH_SOURCE)"

sudo rpm-ostree update

#ffmpeg
#mpd
#mpv
packages="
gnuplot
htop
mpc
ncmpcpp
neofetch
neovim
nethogs
pavucontrol
perl-Image-ExifTool
qalc
ranger
rclone
tldr
util-linux-user
zathura-pdf-mupdf
zsh
"
if (( $# > 0 )); then
	packages="$packages
	$(cat "$1")"
fi
message "Installing Packages"
rpm-ostree install $packages


message "Installing Flatpaks"
flatpaks="
org.gimp.GIMP
org.inkscape.Inkscape
com.valvesoftware.Steam
org.signal.Signal
com.mojang.Minecraft
com.discordapp.Discord
"
sudo flatpak -y install flathub $flatpaks

message "Linking ~/.minecraft/"
mkdir -p $HOME/.var/app/com.mojang.Minecraft/data/minecraft/saves
mkdir -p $HOME/.var/app/com.mojang.Minecraft/data/minecraft/resourcepacks
rm -rf $HOME/.minecraft
ln -fs $HOME/.var/app/com.mojang.Minecraft/data/minecraft $HOME/.minecraft

message "Installing Rust (with rustup)"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path
