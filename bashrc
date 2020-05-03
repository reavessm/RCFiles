########################################
# Stephen's Bash Runtime Configuration #
########################################

#[[ -n `echo $DESKTOP_SESSION | grep i3` ]] && /home/reavessm/.screenlayout/default.sh

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Global Definitions
# {{{
VISUAL=vim
EDITOR=vim
TERM=xterm

MY_OS=`awk -F "=" '/^NAME/ {gsub(/"/, "", $2); print $2}' /etc/os-release 2> /dev/null`
[ -z "$MY_OS" ] && MY_OS=`uname`
DEF_COLOR='\e[39m'
NORM_COLOR='\033[1;30m'
BLINK='\e[5m'
RES='\e[0m'
GIT='\e[0m'
BACK='\e[49m'

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
# }}}

# Source aliases and functions
# {{{
[ -f ~/.bash_aliases ] && . ~/.bash_aliases
[ -f ~/.bash_functions ] && . ~/.bash_functions
# }}}

# Determine OS
# {{{
case $MY_OS in
  Ubuntu) 
    OS_COLOR='\e[032m' # Green
    ;;
  Fedora)
    OS_COLOR='\e[094m' # Blue
    ;;
  Arch)
    OS_COLOR='\e[31m'  # Red
    ;;
  *BSD)
    OS_COLOR='\e[93m'  # Light Yellow
    ;;
  *SUSE*)
    OS_COLOR='\e[95m'  # Light Magenta
    ;;
  Gentoo)
    OS_COLOR='\e[96m'  # Light Cyan
    ;;
  Alpine*)
    OS_COLOR='\e[91m'
    ;;
  *) ;;
esac
# }}}

parse_load_average() {
# {{{
  AVG=$(awk '{print $1}' /proc/loadavg)

  if [[ ${AVG} < "$(( $(nproc) / 4 ))" ]]
  then
    # Gray
    #LOAD_COLOR='\033[1;30m'
    LOAD_COLOR='\e[90m'
  elif [[ ${AVG} < "$(( $(nproc) / 2 ))" ]]
  then
    # Green
    #LOAD_COLOR='\033[40;1;32m'
    LOAD_COLOR='\e[49m\e[92m'
  elif [[ ${AVG} < $(( 3 * $(nproc) / 4)) ]]
  then
    # Yellow
    #LOAD_COLOR='\033[1;33m'
    LOAD_COLOR='\e[93m'
  else
    # Red
    #LOAD_COLOR='\033[1;31m'
    LOAD_COLOR='\e[91m'
  fi
# }}}
}

parse_git_branch() {
# {{{
  BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/' | xargs`
  [[ -n $BRANCH ]] && BRANCH=" $BRANCH"
# }}}
}

error_test() {
# {{{
  [[ $? != "0" ]] && ERR=' \e[91mX' || ERR=''
# }}}
}
  
git_color() { 
# {{{
  local git_status=`git status 2> /dev/null`
  if [[ "`echo $git_status | grep 'Your branch is ahead'`" ]]
  then
    GIT='\e[91m' # Light Red
  elif [[ "`echo $git_status | grep 'Your branch is behind'`" ]]
  then
    GIT='\e[91m X'
  elif [[ "`echo $git_status | grep 'Changes to be committed:'`" ]]
  then
    GIT='\e[92m' # Light Green
  elif [[ "`echo $git_status | grep 'Untracked files:'`" || "`echo $git_status | grep 'Changes not staged for commit:'`" || "`echo $git_status | grep 'modified'`" ]]
  then
    GIT='\e[96m' # Cyan
  elif [[ "`echo $git_status | grep 'nothing to commit'`" ]]
  then
    GIT='\e[97m' # White 
  else
    GIT='\e[0m'
  fi
# }}}
} 

set_bash_prompt() {
# {{{
  error_test
  parse_git_branch
  git_color
  parse_load_average
  PS1="$BACK$LOAD_COLOR\u$NORM_COLOR@$OS_COLOR\h$NORM_COLOR:\w [\d]$GIT$BLINK$BRANCH$RES$ERR\n$OS_COLOR> $DEF_COLOR"
# }}}
} 

# Rice
# {{{
PROMPT_COMMAND=set_bash_prompt

# Run tmux only if tmux is installed and not currently running
[[ `which tmux` && -z $TMUX ]] && (tmux attach || tmux)

# Cool stuff on login
/usr/bin/neofetch --config ~/.neofetch.conf 2> /dev/null

# }}}

# Settings
# {{{
# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# Allows script.sh instead of ./script.sh
export PATH=.:$PATH

# vi mode
set -o vi
set editing-mode vi

# append to the history file, don't overwrite it
shopt -s histappend

# Allows you to cd by just typing the directory name
shopt -s autocd

# Use directory spell checking for 'cd'
shopt -s cdspell

# Autocomplete hostnames following '@'
shopt -s hostcomplete

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# Include filenames beginning with a `.' in the results of filename expansion
shopt -s dotglob
# }}}

# Make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Enable programmable completion features 
# {{{
#(you don't need to enable this, if it's already enabled in /etc/bash.bashrc 
# and /etc/profile sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
# }}}
export VIMRUNTIME="/usr/share/vim/$(ls --color=no /usr/share/vim/ | sort | tail -n 2 | head -n 1)"
