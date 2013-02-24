HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
zstyle :compinstall filename '/home/saul/.zshrc'
autoload -U compinit promptinit
compinit
promptinit
 
autoload -U colors && colors
PROMPT="%{$fg_no_bold[green]%}%B%n@%m%b %{$fg_no_bold[yellow]%}%B▸▹%b %{$reset_color%}"
RPROMPT=" %{$fg_no_bold[blue]%}%~%{$reset_color%}"

export PATH=$PATH:/home/saul/bin:/usr/local/bin
export PATH=$PATH:/usr/bin/vendor_perl

export EDITOR=vim
export VISUAL=vim

alias ls='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto'
alias ll='ls -lh --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto'
