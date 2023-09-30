### Note ### {{{
## An aproximation of Notational Velocity and Terminal Velocity
## gensub currently replacing
function note() {
    pushd ~/Notes 1>/dev/null && \
    vim $(fzf -i --cycle --reverse --preview-window=down --preview='cat {}' --print-query | gawk 'END{if($0 !~ /.txt$/){$0=gensub(" ","_","g",$0) ".txt"}; print $0}')
    popd 1>/dev/null
}
### End Note ### }}}
