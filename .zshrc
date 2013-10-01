export TERM=rxvt-unicode
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

bindkey -v
bindkey '\e[3~' delete-char
bindkey '^R' history-incremental-search-backward

zstyle :compinstall filename '/home/saul/.zshrc'
autoload -U compinit promptinit
compinit
promptinit
 
autoload -U colors && colors
PROMPT="%{$fg_no_bold[magenta]%}%B%n@%m%b %{$fg_no_bold[yellow]%}%B▸▹%b %{$reset_color%}"
RPROMPT=" %{$fg_no_bold[blue]%}%~%{$reset_color%}"

export PATH=$PATH:/home/saul/bin:/usr/local/bin
export PATH=$PATH:/usr/bin/vendor_perl

export EDITOR=vim
export VISUAL=vim

alias ls='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto'
alias ll='ls -lh --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto'

# tmux assume 256 colour
alias tmux='tmux -2'

# taskwarrior
alias tls='task ls'

# Go
export GOPATH=/srv/go
export GOROOT=/usr/local/go
export PATH=$PATH:$GOPATH/bin

