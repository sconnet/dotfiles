#!/bin/zsh
#-----------------------------------------------------------------------
# $ZDOTDIR/.zshrc
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
#
# setopt is equivalent to set -o in ksh; this is a special builtin by the
# POSIX standard
#
# Setting variables (use no spaces between =)
# myvar=myvalue
# myarray=('first element', 'second element')
# print $myarray[2]
#-----------------------------------------------------------------------

# silent on error
setopt nobeep

# silent pushd
setopt pushdsilent

# save the time and how long a command ran
setopt extendedhistory

# do not create a new history file
setopt appendhistory

# print the exit value of programs with non-zero exit status
#setopt printexitvalue

# you can simply type the name of a directory, and it will become the current
# directory
setopt autocd

# turns on spelling correction for commands
#setopt correct

# option turns on spelling correction for all arguments
#setopt correctall

# autocorrect commands
#setopt correct_all

# lets files beginning with a . be matched without explicitly specifying the
# dot
setopt globdots

# prevents the current line from being saved in the history if it is the same
# as the previous one;
setopt histignoredups

# prevents the current line from being saved if it begins with a space
setopt histignorespace

# prevents you from accidentally overwriting an existing file if you really do
# want to clobber a file, you can use the >! operator
setopt noclobber

# save each command's beginning timestamp and the duration to the history file
setopt extended_history

# Don't send SIGHUP to background processes when the shell exits.
#setopt nohup

bindkey -v # vi mode
#setopt vi

export KEYTIMEOUT=1

# Use a default width of 80 for manpages for more convenient reading
export MANWIDTH=${MANWIDTH:-80}

# see man ls
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export ALTERNATE_EDITOR="vi"
export EDITOR="vim"
export VISUAL="gvim"
export GIT_EDITOR="vim"
#export ANDROID_HOME=$HOME/Library/Android/sdk
export ANDROID_HOME=$HOME/adb
export GPG_TTY=$TTY

# turn off brew from phoning home with analytics
export HOMEBREW_NO_ANALYTICS=1

# don't let less clear the screen
export PAGER="less -X"

export GUILE_LOAD_PATH=/usr/local/share/guile/site/3.0
export GUILE_LOAD_COMPILED_PATH=/usr/local/lib/guile/3.0/site-ccache
export GUILE_SYSTEM_EXTENSIONS_PATH=/usr/local/lib/guile/3.0/extensions

path=(
    $path
    $HOME/bin
    $ANDROID_HOME/platform-tools
    $ANDROID_HOME/tools
    /opt/local/bin
    /usr/local/opt/ncurses/bin
    /usr/local/opt/python/libexec/bin
    /usr/local/opt/ruby/bin
    /usr/local/opt/sqlite/bin
    /usr/local/opt/tcl-tk/bin
    /usr/local/sbin
    /usr/local/opt/icu4c/bin
    /usr/local/opt/openssl@1.1/bin
    /Users/clu/Library/Python/3.8/bin
)
export PATH

# prepend to path - autodetect path and env vars for both pyenv and perl
#eval "$(pyenv init -)"
#eval "$(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib=$HOME/perl5)"

# support colors in less
export LESS_TERMCAP_us=$'\E[01;32m'

# support extensions for pass
export PASSWORD_STORE_ENABLE_EXTENSIONS=true

# add another directory for zsh completions
#fpath+=~/.zfunc

# automatically remove duplicates from these arrays
typeset -U cdpath cppflags fpath ldflags manpath path

# set browser environment variable
export BROWSER=open

# enable colors and change prompt:
autoload -U colors && colors

# support mass rename files
autoload zmv

# support CLI calculator
autoload zcalc

RED=$fg[red]
BLUE=$fg[blue]
GREEN=$fg[green]
MAGENTA=$fg[magenta]
YELLOW=$fg[yellow]
RESET_COLOR=$reset_color
#PS1="%B%{$RED%}[%{$YELLOW%}%n%{$GREEN%}@%{$BLUE%}%M %{$MAGENTA%}%~%{$RED%}]%{$RESET_COLOR%}%b "
#PS1="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%(5~|%-1~/.../%3~|%4~) %{$reset_color%}%% "

# built in color schemes for prompt
#autoload -U promptinit && promptinit

# list all color schemes
#prompt -p
# adam1 adam2 bart bigfade clint default elite2 elite fade fire off oliver pws
# redhat restore suse walters zefram prompt bigfade red white

# %F{xxx} is foreground color
# %K{xxx} is background color
#PS1="%F{214}%K{000}%m%F{015}%K{000}:%F{039}%K{000}%~%F{015}%K{000}\$ "
PS1="%F{214}%m%F{015}:%F{039}%~%F{015}\$ "

# environment variables for RUST
[[ -f ~/.cargo/env ]] && . ~/.cargo/env

# set CPPFlags and friends
[[ -f ~/.buildflags.zsh ]] && . ~/.buildflags.zsh

# set aliases
[[ -f ~/.aliasrc.zsh ]] && . ~/.aliasrc.zsh

# declare functions
[[ -f ~/.functions.zsh ]] && . ~/.functions.zsh

# set security related environment variables
[[ -f ~/.security.zsh ]] && . ~/.security.zsh

# set fuzzy file finder things
[[ -f ~/.fzf.zsh ]] && . ~/.fzf.zsh
