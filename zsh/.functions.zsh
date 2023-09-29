#!/bin/zsh
#-----------------------------------------------------------------------
# functions look like this:
# fn() {
# ... do something ...
# }
# call function like this:
# fn
#-----------------------------------------------------------------------

# MacOS specific functions
if [[ `uname` == "Darwin" ]]; then

    # turn hidden files on/off in Finder
    function killFinder() {
        killall Finder /System/Library/CoreServices/Finder.app;
    }

    function hiddenOn() {
        defaults write com.apple.Finder AppleShowAllFiles YES && killFinder;
    }

    function hiddenOff() {
        defaults write com.apple.Finder AppleShowAllFiles NO && killFinder;
    }

    # view man pages in Preview
    function pman() {
        ps=`mktemp -t manpageXXXX`.ps ; man -t $@ > "$ps" ; open "$ps" ;
    }
fi
