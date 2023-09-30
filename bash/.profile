#------------------------------------------------------------------------------
# .profile - Run commands that you want to run once when a user logs in but
#            not every time they open a terminal.
#
# ~/.profile: executed by the command interpreter for login shells.
#
# Environment variables such as PATH get modified in ~/.profile.
#
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
#
# This file (.profile) is used instead of .bash_profile because this file is a
# POSIX standard.
#
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.
#------------------------------------------------------------------------------

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# set keybinding like vi - not needed if set in .inputrc file
#set -o vi

# environment variables only need to be set once per login
export PAGER='less -X'       # prevent cls when exiting man
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/gvim

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# if running bash
if [ -n "$BASH_VERSION" ]; then
    if [ -f ~/.bashrc ]; then . ~/.bashrc; fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ]; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
