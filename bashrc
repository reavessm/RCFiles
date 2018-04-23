if [[ "$(uname -a | grep Ubuntu)" != "" ]]; then
  # ~/.bashrc: executed by bash(1) for non-login shells.
  # see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
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

  if [ "$color_prompt" = yes ]; then
      PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
  else
      PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
  fi
  unset color_prompt force_color_prompt

  # If this is an xterm set the title to user@host:dir
  case "$TERM" in
  xterm*|rxvt*)
      PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
      ;;
  *)
      ;;
  esac

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
  export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

  # some more ls aliases
  alias ll='ls -alF'
  alias la='ls -A'
  alias l='ls -CF'

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

  # Custom Prompt
  parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)\'
  }
  PS1='\[\e[;032m\]\w \e[5m$(parse_git_branch)\e[25m\e[32m>\e[39m'

  # Allows script.sh instead of ./script.sh
  export PATH=$PATH:.

  neofetch --gtk_shorthand on --disable packages --refresh_rate on --os_arch off --cpu_cores logical --cpu_temp C 2> /dev/null

 # End of Ubuntu Bash

# Fedora Bash
elif [[ "$(uname -a | grep fc)" != "" || "$(uname -a | grep rawhide)" != "" ]]; then

# vi mode
set -o vi

# are we an interactive shell?
if [ "$PS1" ]; then
  if [ -z "$PROMPT_COMMAND" ]; then
    case $TERM in
    xterm*|vte*)
      if [ -e /etc/sysconfig/bash-prompt-xterm ]; then
          PROMPT_COMMAND=/etc/sysconfig/bash-prompt-xterm
      elif [ "${VTE_VERSION:-0}" -ge 3405 ]; then
          PROMPT_COMMAND="__vte_prompt_command"
      else
          PROMPT_COMMAND='printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'
      fi
      ;;
    screen*)
      if [ -e /etc/sysconfig/bash-prompt-screen ]; then
          PROMPT_COMMAND=/etc/sysconfig/bash-prompt-screen
      else
          PROMPT_COMMAND='printf "\033k%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'
      fi
      ;;
    *)
      [ -e /etc/sysconfig/bash-prompt-default ] && PROMPT_COMMAND=/etc/sysconfig/bash-prompt-default
      ;;
    esac
  fi
  # Turn on parallel history
  shopt -s histappend
  history -a
  # Turn on checkwinsize
  shopt -s checkwinsize
  # You might want to have e.g. tty in prompt (e.g. more virtual machines)
  # and console windows
  # If you want to do so, just add e.g.
  # if [ "$PS1" ]; then
  #   PS1="[\u@\h:\l \W]\\$ "
  # fi
  # to your custom modification shell script in /etc/profile.d/ directory
fi

if ! shopt -q login_shell ; then # We're not a login shell
    # Need to redefine pathmunge, it get's undefined at the end of /etc/profile
    pathmunge () {
        case ":${PATH}:" in
            *:"$1":*)
                ;;
            *)
                if [ "$2" = "after" ] ; then
                    PATH=$PATH:$1
                else
                    PATH=$1:$PATH
                fi
        esac
    }

    # By default, we want umask to get set. This sets it for non-login shell.
    # Current threshold for system reserved uid/gids is 200
    # You could check uidgid reservation validity in
    # /usr/share/doc/setup-*/uidgid file
    if [ $UID -gt 199 ] && [ "`id -gn`" = "`id -un`" ]; then
       umask 002
    else
       umask 022
    fi

    SHELL=/bin/bash
    # Only display echos from profile.d scripts if we are no login shell
    # and interactive - otherwise just process them to set envvars
    for i in /etc/profile.d/*.sh; do
        if [ -r "$i" ]; then
            if [ "$PS1" ]; then
                . "$i"
            else
                . "$i" >/dev/null
            fi
        fi
    done

    unset i
    unset -f pathmunge
fi

export PATH=$PATH:.
  if [ -f ~/.bash_aliases ]
  then
    . ~/.bash_aliases
  fi

  #if [ "$(echo $TMUX)" == "" ] 
  #then
  #  tmux
  #fi

  #Custom Prompt
  parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
  }
  PS1='\[\e[;034m\]\u@\h:\w [\d] \e[5m\e[97m$(parse_git_branch)\e[25m\n\e[;034m>\e[39m'
  
  neofetch --config ~/.neofetch.conf 2> /dev/null


# End of Fedora Bash
elif [[ "$(uname -a | grep ARCH)" != "" ]]; then
  #Arch Bash
  #
  # ~/.bashrc
  #

  # If not running interactively, don't do anything
  [[ $- != *i* ]] && return

  alias ls='ls --color=auto'
  parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
  }
  PS1='\e[31m\W \e[5m\e[97m$(parse_git_branch)\e[25m\e31m> \e[39m'

  if [ -f ~/.bash_aliases ]
  then
	  . .bash_aliases
  fi
 
  if [ "$(echo $TMUX)" == "" ] 
  then
    tmux
  fi

  #if [ -f ~/.display.txt ]
  #then
  #	echo -e "\e[31m$(cat ~/.display.txt)\e[39m"
  #fi

  if [ -f ~/.reavesOSFire.txt ]
  then
	  echo -e "\e[31m$(cat ~/.reavesOSFire.txt)\e[39m"
  fi

  #if [ -f ~/.reavesOSKeyboard.txt ]
  #then
  #	echo -e "\e[31m$(cat ~/.reavesOSKeyboard.txt)\e[39m"
  #fi

  #if [ -f ~/.reavesOSLarry3d.txt ]
  #then
  #	echo -e "\e[31m$(cat ~/.reavesOSLarry3d.txt)\e[39m"
  #fi


  #if [ -f ~/.reavesOSTrain.txt ]
  #then
  #	echo -e "\e[31m$(cat ~/.reavesOSTrain.txt)\e[39m"
  #fi



  if [ -f ~/.entrance.sh ]
  then
	  ~/.entrance.sh
  fi

  export VISUAL="vim"

  # Allows for script.sh instead of ./script.sh
  export PATH=$PATH:.

  neofetch --gtk_shorthand on --disable packages --refresh_rate on --os_arch off --cpu_speed off --cpu_cores logical --cpu_temp C 2> /dev/null

fi #End of Arch Bash


if [ -f ~/.bash_aliases ]; then
     . ~/.bash_aliases
  fi
