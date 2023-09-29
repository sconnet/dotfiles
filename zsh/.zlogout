#!/bin/zsh
#-----------------------------------------------------------------------
# $ZDOTDIR/.zlogout
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

