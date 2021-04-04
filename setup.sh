#!/bin/bash

src="$(dirname $BASH_SOURCE)"
home="$HOME"

# Installs
programs="ranger vim"
if [ $(command -v apt) ]; then
	sudo apt -y install $programs
elif [ $(command -v yum) ]; then
	sudo yum -y install $programs
elif [ $(command -v pacman) ]; then
	sudo pacman -S $programs
else
	echo "Could not install programs"
fi


# Vim
if [ -f $home/.vimrc ]; then
	mv $home/.vimrc $home/.vimrc.old
fi
cp $src/vimrc $home/.vimrc

airline="$home/.vim/pack/dist/start/vim-airline"
if [ ! -e $airline ]; then
	git clone https://github.com/vim-airline/vim-airline $airline
fi


# Zsh
if [ -f $home/.zshrc ]; then
	mv $home/.zshrc $home/.zshrc.old
fi
cp $src/zshrc $home/.zshrc
if [[ $(cat /etc/shells) =~ zsh ]]; then
	if [[ $(ps) =~ zsh ]]; then
		sleep 0
	else
		chsh -s /bin/zsh
	fi
fi


# Bash
cat $src/inputrc >> $home/.inputrc


# Git
if [[ $(git config user.name) == "" ]]; then
	read -p "Setup git user? [y/n] " answer
	case $answer in
		y|Y) cp $src/gitconfig $home/.gitconfig;;
		n|N) ;;
		* ) echo "Unknown response, exiting.";;
	esac
fi
