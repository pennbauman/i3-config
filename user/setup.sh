#!/bin/sh
# Create new user

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

sudo useradd -s /usr/bin/zsh -m pcb8gb

$(dirname $BASH_SOURCE)/configure.sh "$user"
