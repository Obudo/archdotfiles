# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/obudo/.zshrc'

autoload -Uz compinit promptinit colors
compinit
colors
promptinit
prompt redhat

alias ls='ls --color=auto'
alias b="clang -Werror -pedantic-errors -Wall -Wextra -Wsign-conversion"
alias b++="clang++ -Werror -pedantic-errors -Wall -Weffc++ -Wextra -Wsign-conversion -std=c++2a"
alias zt='zathura'
alias v='nvim'
alias dotfiles='/usr/bin/git --git-dir=$HOME/.archdotfiles/ --work-tree=$HOME'
alias lipsum='curl -s -X POST https://lipsum.com/feed/json -d "amount=5" -d "what=paras" -d"start=true" | jq -r ".feed.lipsum"'

zstyle ':completion:*' menu select
zstyle ':completion:*' rehash true

if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
	exec 'sway'
fi
eval "$(starship init zsh)"
