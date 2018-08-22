########################################
# Stephen's Bash Runtime Configuration #
########################################

[[ -n `echo $DESKTOP_SESSION | grep i3` ]] && /home/reavessm/.screenlayout/default.sh

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

VISUAL=vim
EDITOR=vim

MY_OS=`awk -F "=" '/^NAME/ {gsub(/"/, "", $2); print $2}' /etc/os-release`
DEF_COLOR='\e[39m'
BLINK='\e[5m'
RES='\e[0m'
GIT='\e[0m'

# Source aliases and functions
[ -f ~/.bash_aliases ] && source ~/.bash_aliases
[ -f ~/.bash_functions ] && source ~/.bash_functions

case $MY_OS in
  Ubuntu) 
    OS_COLOR='\e[032m' # Green
    ;;
  Fedora)
    OS_COLOR='\e[034m' # Blue
    ;;
  Arch)
    OS_COLOR='\e[31m'  # Red
    ;;
  *BSD)
    OS_COLOR='\e[33m'  # Yellow
    ;;
  *) ;;
esac

parse_git_branch() {
  BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/' | xargs`
  [[ -n $BRANCH ]] && BRANCH=" $BRANCH"
}

error_test() {
  [[ $? != "0" ]] && ERR=' \e[91mX' || ERR=''
}
  
git_color() {
  local git_status=`git status 2> /dev/null`
  if [[ "`echo $git_status | grep 'Your branch is ahead'`" ]]
  then
    GIT='\e[91m' # Light Red
  elif [[ "`echo $git_status | grep 'Changes to be committed:'`" ]]
  then
    GIT='\e[92m' # Light Green
  elif [[ "`echo $git_status | grep 'Untracked files:'`" ]]
  then
    GIT='\e[96m' # Cyan
  elif [[ "`echo $git_status | grep 'nothing to commit'`" ]]
  then
    GIT='\e[97m' # White 
  else
    GIT='\e[0m'
  fi
}

set_bash_prompt() {
  error_test
  parse_git_branch
  git_color
  PS1="$OS_COLOR\u@\h:\w [\d]$GIT$BLINK$BRANCH$RES$ERR\n$OS_COLOR> $DEF_COLOR"
}

PROMPT_COMMAND=set_bash_prompt

# Allows script.sh instead of ./script.sh
export PATH=$PATH:.

# vi mode
set -o vi

# Run tmux only if tmux is installed and not currently running
[[ `which tmux` && -z $TMUX ]] && tmux

# Cool stuff on login
#/usr/bin/neofetch --config ~/.neofetch.conf 2> /dev/null

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

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
