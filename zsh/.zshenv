#!/bin/zsh
#-----------------------------------------------------------------------
# $ZDOTDIR/.zshenv
#
# This file is sourced every time ZSH is launched, no matter what. Put as
# little as possible in here. This is used for a basic, no frills shell.
#
# Settings for interactive shells, such as prompts, have no business in
# /etc/zshenv unless you really insist that all users have them as defaults for
# every single shell.
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

# Put all commands in between this if
#if [[ ! -o norcs ]]; then
#    path=(~/bin $path)
#fi
