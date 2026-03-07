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
# .zshrc
#
# setopt is equivalent to set -o in ksh; this is a special builtin by the
# POSIX standard
#
# Setting variables (use no spaces between =)
# myvar=myvalue
# myarray=('first element', 'second element')
# print $myarray[2]
#
# functions look like this:
# fn() {
# ... do something ...
# }
# call function like this:
# fn
#
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

# support mass rename files
autoload zmv

# support CLI calculator
autoload zcalc

path=(
    $path
    $HOME/bin
    /opt/homebrew/bin
    /opt/homebrew/opt/openssl/bin
)
export PATH

# setup aliases
[[ -f ~/zsh/promptrc ]] && source ~/zsh/promptrc

# setup aliases
[[ -f ~/zsh/aliasrc ]] && source ~/zsh/aliasrc

# set CPPFlags and friends
[[ -f ~/zsh/buildflagrc ]] && source ~/zsh/buildflagrc

# set functions
[[ -f ~/zsh/securityrc ]] && source ~/zsh/securityrc

# set security related environment variables
[[ -f ~/zsh/functionrc ]] && source ~/zsh/functionrc

# set fuzzy file finder things
[[ -f ~/zsh/fzfrc ]] && source ~/zsh/fzfrc

# automatically remove duplicates from these arrays
typeset -U cdpath cppflags fpath ldflags manpath path
