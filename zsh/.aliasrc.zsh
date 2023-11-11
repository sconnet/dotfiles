alias grep="grep --color"
alias info="info --vi-keys"
alias ll="ls -FlaG"

alias meld="open -W -a Meld $@

# MacOs specific aliases
if [[ `uname` == "Darwin" ]]; then
    # these really aren't necessary anymore since we can create soft links in
    #alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"
    #alias gvim="/Applications/MacVim.app/Contents/MacOS/Vim -g"
fi
