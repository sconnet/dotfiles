alias grep="grep --color"
alias info="info --vi-keys"
alias ll="ls -FlaG"

# MacOs specific aliases
if [[ `uname` == "Darwin" ]]; then
    # these really aren't necessary anymore since we can create soft links in
    # /usr/local/bin
    #alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"
    #alias gvim="/Applications/MacVim.app/Contents/MacOS/Vim -g"
fi
