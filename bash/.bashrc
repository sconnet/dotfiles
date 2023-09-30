#------------------------------------------------------------------------------
# ~/.bashrc: executed by bash(1) for non-login shells.
#
# See /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples.
#
# bashrc contains commands that are specific to the Bash shells. Every
# interactive non-login shell reads .bashrc first. Normally .bashrc is the
# best place to add aliases and Bash related functions.
#
# *****************************************************************************
# Login & Interactive Shell
# *****************************************************************************
# A login shell is tty or 'bash --login' argument.
#
#     /usr/bin/bash
#     |   |   |   |
#     |   |   |   +----> /etc/profile
#     |   |   |          | |
#     |   |   |          | +--------> /etc/profile.d/*
#     |   |   |          +----------> /etc/bash.bashrc
#     |   |   +--------> ~/.bash_profile (STOP)
#     |   +------------> ~/.bash_login (STOP)
#     +----------------> ~/.profile (STOP)
#                          |
#                          +--------> ~/.bashrc
#
# *****************************************************************************
# Non-login & Interactive Shell
# *****************************************************************************
# The type of shell you get when you open a terminal window is a non-login
# shell. You don't need to authenticate to launch a shell when you're already
# logged in. Login and non-login shells are interactive shells.
#
#     /usr/bin/bash
#     | |
#     | +--------------> /etc/bash.bashrc
#     +----------------> ~/.bashrc
#
# *****************************************************************************
# Non-interactive Shell
# *****************************************************************************
# There are also non-interactive shells, too. These are the type of shells
# that get launched when a script is executed. The script is launched in a new
# shell. Non-interactive shells don't read any profile files when they launch.
# They do inherit environment variables, but they won't know anything about
# aliases, for example, whether they're defined on the command line or in a
# configuration file.
#
#     /usr/bin/bash
#     |
#     +----------------> no init files but inherits environment variables
#
#
# *****************************************************************************
# BASH INITIALIZATION FILES
# *****************************************************************************
#
# /etc/profile
# This is a "System wide" initialisation file that is executed during login.
# This file provides initial environment variables and initial "PATH"
# locations.
#
# /etc/bashrc
# This again is a "System Wide" initialisation file. This file is executed
# each time a Bash shell is opened by a user. Here you can define your default
# prompt and add alias information. Values in this file can be overridden by
# their local ~/.bashrc entry.
#
# ~/.bash_profile
# If this file exists, it is executed automatically after /etc/profile during
# the login process. This file can be used by each user to add individual
# entries. The file however is only executed once at login and normally then
# runs the users .bashrc file.
#
# ~/.bash_login
# If the ".bash_profile" does not exist, then this file will be executed
# automatically at login.
#
# ~/.profile
# If the ".bash_profile" or ".bash_login" do not exist, then this file is
# executed automatically at login.
#
# ~/.bashrc
# This file contains individual specific configurations. This file is read at
# login and also each time a new Bash shell is started. Ideally, this is where
# you should place any aliases.
#
# ~/.bash_logout
# This file is executed automatically during logout.
#
# ~/.inputrc
# This file is used to customize key bindings/key strokes.
#------------------------------------------------------------------------------


# If not running interactively, don't do anything - prevent bash from sourcing
# this file when we run scripts. Instead scripts will just inherit the
# environment variables.
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

# make 'less' more friendly for non-text input files, see lesspipe(1)
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

# Source more peronal config files if they exist
if [ -f ~/.bash_aliases ]; then . ~/.bash_aliases; fi
if [ -f ~/.bash_functions ]; then . ~/.bash_functions; fi

# Enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
