#!/bin/zsh
#-----------------------------------------------------------------------
# $ZDOTDIR/.zprofile
#
# Order of startup execution:
#     /etc/zshenv        - executed in all instances
#     $ZDOTDIR/.zshenv   - executed in all instances
#     /etc/zprofile      - executed if login shell
#     $ZDOTDIR/.zprofile - executed if login shell
#     /etc/zshrc         - executed if shell is interactive
#     $ZDOTDIR/.zshrc    - executed if shell is interactive
#     /etc/zlogin        - executed if login shell
#     $ZDOTDIR/.zlogin   - executed if login shell
#
# Order of exit execution:
#     $ZDOTDIR/.zlogout  - if login shell exits
#     /etc/zlogout       - if login shell exits
#
# if $ZDOTDIR is not set, then $HOME is used
#-----------------------------------------------------------------------

#eval "$(/usr/local/bin/brew shellenv)"
eval "$(/opt/homebrew/bin/brew shellenv)"

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export ALTERNATE_EDITOR="vi"
export EDITOR="vim"
export XEDITOR="gvim"
export VISUAL="gvim"
export GIT_EDITOR="vim"
#export ANDROID_HOME=/Users/clu/Library/Android/sdk
export GPG_TTY=`tty`

# turn off brew from phoning home with analytics
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_ENV_HINTS=1

export KEYTIMEOUT=1

# Use a default width of 80 for manpages for more convenient reading
export MANWIDTH=${MANWIDTH:-80}

# don't let less clear the screen
export PAGER="less -X"

# support extensions for pass
export PASSWORD_STORE_ENABLE_EXTENSIONS=true

# support colors in less
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# set browser environment variable
export BROWSER=open

