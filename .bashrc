# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

#TERM=xterm-256color;
#TERM=rxvt-256color;
#TERM=rxvt-unicode;
#TERM=urxvt;

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups


complete -cf sudo

shopt -s cdspell
shopt -s checkwinsize
shopt -s cmdhist
shopt -s dotglob
shopt -s expand_aliases
shopt -s extglob
shopt -s histappend
shopt -s hostcomplete
shopt -s nocaseglob

export HISTSIZE=10000
export HISTFILESIZE=${HISTSIZE}
export HISTCONTROL=ignoreboth

alias ls='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto'
alias ll='ls -lh --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto'
alias la='ls -lah --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto'
alias rdp='rdesktop -g 1280x800 -fPzr sound:off -u user'
alias rdpwin='rdesktop -g 1280x800 -fPzr sound:off -u user user@windowsbox.addy &'
alias grep='grep --color=tty -d skip'
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias pacman='sudo pacman'
alias bauerbill='sudo bauerbill'
# alias wssh='ssh user@windowsbox.addy'

# vim stuff
export EDITOR=vim
export VISUAL=vim
set -o vi

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
  debian_chroot=$(cat /etc/debian_chroot)
fi
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# color man pages
export LESS_TERMCAP_mb=$'\e[01;34m'
export LESS_TERMCAP_md=$'\e[01;34m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;44;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[38;05;111m;'

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# urxvt title
case $TERM in
	rxvt-256color)
	trap 'echo -ne "\e]0;$USER@$HOSTNAME: $BASH_COMMAND\007"' DEBUG
	;;
esac

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
. /etc/bash_completion
fi

export PATH=$PATH:/home/saul/bin
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/home/saul/.gem/ruby/1.9.1/bin

export RUBYOPT=rubygems
export XDG_DATA_HOME=/home/saul/.data
export TEXINPUTS=".:~/clwd-docs/latex:"

# tmux ensure 256 color under ssh
alias tmux="TERM=screen-256color-bce tmux"

# read in dircolors
eval `dircolors $HOME/.dircolors`
