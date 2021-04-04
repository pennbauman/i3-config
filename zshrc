# Oh My ZSH
if [ ! -d $HOME/.oh-my-zsh ]; then
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
# editor
export EDITOR=/bin/vim
export VISUAL=/bin/vim

# General settings
HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"

# User configuration
unsetopt share_history
bindkey -r '^[[Z'
zstyle ':completion:*' list-colors
tabs -4

# Configure Prompt
autoload -U colors && colors
setopt PROMPT_SUBST
set_prompt() {
	# starter
	PS1='%{$fg_bold[green]%}['
	# ssh indicator
	if [ ! -z $SSH_CONNECTION ]; then
		PS1+='%{$reset_color%}%{$fg[yellow]%}ssh:'
	fi
	# name@computer
	PS1+='%{$fg_bold[green]%}%n@%m'
	# directory
	PS1+=" %{$fg_bold[white]%}%1~"

	# Git
	if git rev-parse --is-inside-work-tree 2> /dev/null | grep -q 'true' ; then
		PS1+=" %{$fg_bold[blue]%}$(git rev-parse --abbrev-ref HEAD 2> /dev/null)%{$reset_color%}"
		if [ $(git status --short | wc -l) -gt 0 ]; then 
			PS1+="%{$fg[red]%}+$(git status --short | wc -l | awk '{$1=$1};1')%{$reset_color%}"
		fi
	fi

	# ender
	PS1+="%{$fg_bold[green]%}]$ %{$reset_color%}% "
	# partial command
	PS2="%{$fg[yellow]%}%_%{$reset_color%} %{$fg_bold[green]%}>%{$reset_color%} "
}
precmd_functions+=set_prompt


# Aliases
alias ls="ls -FAh --group-directories-first"
alias cp="cp -r"
alias rm="rm -r"
alias chx="chmod +x"
alias less="less -x4"
alias svim="sudoedit $@"
