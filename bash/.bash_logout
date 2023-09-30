#------------------------------------------------------------------------------
# ~/.bash_logout: executed by bash(1) when login shell exits.
#
# Sourced by bash when a bash login shell terminates. You can use it to clear
# the screen, terminate processes, delete command history, or any other
# cleanup activity.
#------------------------------------------------------------------------------

# when leaving the console clear the screen to increase privacy
#if [ "$SHLVL" = 1 ]; then
#    [ -x /usr/bin/clear_console ] && /usr/bin/clear_console -q
#fi

# release any cached credentials
/usr/bin/sudo -K

# clear command history
# history -c
