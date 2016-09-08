alias s='git status'
alias a='git add'
alias au='git add --update'
alias cam='git commit -am'
alias cmm='git commit -m'

# tab completion
# http://stackoverflow.com/a/15009611/4233593
alias g='git'
__git_complete g __git_main
alias pl='git pull'
__git_complete pl _git_pull
alias ph='git push'
__git_complete ph _git_push
alias d='git diff'
__git_complete d _git_diff
alias dc='git diff --cached'
__git_complete dc _git_diff
alias co='git checkout'
__git_complete co _git_checkout
alias r='git reset'
__git_complete r _git_reset
alias cm='git commit'
__git_complete cm _git_commit
alias st='git stash'
__git_complete st _git_stash

# aliased aliases
alias la='git la'

# scripts
alias gup="$prefage_directory/git/upstream.clone.bash"
