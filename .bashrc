
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)

# Additional SSH alias
source ~/.additional_alias/ssh_server
source ~/.additional_alias/*

# for examples

# If not running interactively, don't do anything

case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
    else
    color_prompt=
    fi
fi

force_color_prompt=yes
color_prompt=yes
parse_git_branch() {
 git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

if [ "$color_prompt" = yes ]; then
 PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\][\u@\h]\[\033[01;34m\]\w\[\033[01;31m\]$(parse_git_branch)\[\033[00m\]\$ '
else
 PS1='${debian_chroot:+($debian_chroot)}[\u@\h]\w$(parse_git_branch)\$ '
fi
unset color_prompt force_color_prompt

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#  P
# 
# some more ls aliases
alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CF'

#update shortcut
alias suup='sudo apt update && sudo apt upgrade -y'

#git 
alias gprom='git pull --rebase origin master'
alias gb='git branch'
alias gst='git status'
alias gl='git log --abbrev-commit --stat'
alias gl1='git log --pretty=format:"%C(yellow)%h %Cblue%>(12)%ad %Cgreen%<(7)%aN%Cred%d %Creset%s" --date=format:"%a %D"'
alias gd='git diff'
alias gprod='git pull --rebase origin develop'
alias gitgraph='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'
alias mc='EDITOR=sublime mc'
alias gp='git push origin HEAD'
alias gcm='git commit -m'

function gg { git grep -n -i "$*";  }

alias tmuxload='tmux source-file ~/dotfiles/.tmux.conf'
alias pingg='ping 8.8.8.8'

alias cheatsh='cd ~/Documents/cheatsheets'

# ALWAYS PROMPT REMOVE -- DON'T BE Stupid
alias rm="rm -i"

alias btc='/home/$USER/dev/ruby/ruby_api.rb'

alias gitcheat='cat /home/$USER/cheatsheets/git_cheatsheet/git_cheatsheet'
alias chromeclear='rm -rf ~/.cache/google-chrome'
alias cpvimrc='cp /home/$USER/.vimrc /home/$USER/github/vim_dotfile/'
alias cpbashrc='cp /home/$USER/.bashrc /home/$USER/github/bashrc/'

alias editvimcheat=' vim /home/$USER/cheatsheets/vim_cheatsheet/vim_cheatsheet'
alias editdockercheat=' vim /home/$USER/cheatsheets/docker_cheatsheet/docker_cheatsheet'
alias editgitcheat=' vim /home/$USER/cheatsheets/git_cheatsheet/git_cheatsheet'
alias editbashrc='vim /home/$USER/.bashrc'
alias editvimrc='vim /home/$USER/.vimrc'
alias todo='vim ~/$USER/Desktop/TODO'

# monitor config
# GENERATED USING ARANDR

alias dual_monitor_office='~/.screenlayout/dual_screen_big.sh'
alias single_monitor='~/.screenlayout/single_monitor.sh'
alias external_monitor='~/.screenlayout/external_monitor.sh'

alias caly='cal -y'

# Rails laziness
alias rdbcms='rails db:create && rails db:migrate && rails db:seed'
alias rdbm='rails db:migrate'
alias rdbms='rails db:migrate:status'

# FZF COLOR THEME
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--color fg:242,bg:236,hl:65,fg+:15,bg+:239,hl+:108
--color info:108,prompt:109,spinner:108,pointer:168,marker:168'

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$PATH:$HOME/.composer/vendor/bin"


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
PATH="$HOME/.local/bin:$PATH"
PATH="$HOME/.local/bin:$PATH"
PATH="$HOME/.local/bin:$PATH"


