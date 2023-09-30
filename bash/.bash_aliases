#------------------------------------------------------------------------------
# .bash_alias
#
# This is a place to put your aliases (it is not an offical bash startup file
#
# Called by .bashrc
#------------------------------------------------------------------------------

# some more ls aliases
#alias ll='ls -alF'
alias ll='ls -oaF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Prevent CLS when existing less (PAGER set to 'less -X' instead))
#alias less='less -X'

# always use these flags with systemctl
alias systemctl='systemctl --no-pager --full'
