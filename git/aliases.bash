alias s='git status'
alias a='git add'
alias au='git add --update'
alias cam='git commit -am'
alias cmm='git commit -m'
alias skp='git update-index --skip-worktree'
alias noskp='git update-index --no-skip-worktree'
alias ammend='git commit -a --amend -C HEAD'

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
alias show='git show'
__git_complete show _git_show

# aliased aliases
alias la='git la'
alias b='git b'
alias skpd='git skipped'

# scripts
alias gup="$prefage_directory/git/upstream.clone.bash"

# delete merged branches local & remote
# http://stackoverflow.com/a/6127884/4233593
# http://stackoverflow.com/a/8229823/4233593
git_clean_merged_remote(){
	if [ -z $1 ]; then echo "error: remote required"; return; fi
	if [ -z $2 ]; then echo "error: branch required"; return; fi
	git branch -a --merged remotes/$1/$2 | grep -v $2 | grep "remotes/$1/" | cut -d "/" -f 3 | xargs -n 1 git push --delete $1
}

alias gcr='git_clean_merged_remote'
__git_complete gcr _git_pull

git_clean_merged_local(){
	if [ -z $1 ]; then echo "error: branch required"; return; fi
	git branch --merged | egrep -v "(^\*|master|dev|develop|$1)" | xargs git branch -d
}

alias gcl='git_clean_merged_local'
__git_complete gcl _git_checkout
