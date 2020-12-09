#!/bin/bash
# Added user

loc="$HOME/.dotfiles"

if (( $# < 1 )); then
	echo "User required"
	exit 1
fi
if [ ! -d $loc/user/$1 ]; then
	echo "Unkowm user '$1'"
	exit 1
fi
user=$1

# Set ENV variables
HOME=/home/$user
XDG_CONFIG_HOME=$HOME/.config
XDG_DATA_HOME=$HOME/.local/share

echo "Configuring"

# Making necessary directories
sudo rm -rf $HOME/.config/ranger
sudo mkdir -p $XDG_CONFIG_HOME/git
sudo mkdir -p $XDG_CONFIG_HOME/nvim
sudo mkdir -p $XDG_DATA_HOME/nvim/site/colors
sudo mkdir -p $XDG_DATA_HOME/nvim/site/autoload/airline/themes

# Linking configs
sudo ln -fs $loc/user/$user/gitconfig $XDG_CONFIG_HOME/git/config
sudo ln -fs $loc/configs/nvim.init.vim $XDG_CONFIG_HOME/nvim/init.vim
sudo ln -fs $loc/configs/ranger $XDG_CONFIG_HOME/ranger
sudo ln -fs $loc/configs/user-dirs.dirs $XDG_CONFIG_HOME/user-dirs.dirs
sudo ln -fs $loc/configs/coc-settings.json $XDG_CONFIG_HOME/nvim/coc-settings.json
sudo ln -fs $loc/configs/profile $HOME/.profile
sudo ln -fs $loc/user/$user/zshrc $HOME/.zshrc
sudo ln -fs $loc/user/$user/zsh-dirs $HOME/.zsh-dirs
sudo ln -fs $loc/configs/maia-custom.vim $XDG_DATA_HOME/nvim/site/colors/maia-custom.vim
sudo ln -fs $loc/configs/airline-maia_custom.vim $XDG_DATA_HOME/nvim/site/autoload/airline/themes/maia_custom.vim

# Install Vim Plug
if [ ! -f $HOME/.local/share/nvim/site/autoload/plug.vim ]; then
	sudo curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# Adding directories
sudo mkdir $HOME/documents
sudo mkdir $HOME/downloads
