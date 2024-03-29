alias a='git add'
alias au='git add --update'
function cam() {
    git commit -am "$*"
}
function cmm() {
    git commit -m "$*"
}
alias cma='git commit --amend --no-edit'
alias skp='git update-index --skip-worktree'
alias noskp='git update-index --no-skip-worktree'
alias ammend='git commit -a --amend -C HEAD'
# count git commits http://stackoverflow.com/a/4061706/4233593
alias cgc='git rev-list --count'
alias cgca='git rev-list --count --all'
alias gt='git tag | sort -V'
alias gr='git remote -v'
alias ltag='git tag --sort -version:refname'
alias s='bash -c "git status -sb && git ls-files -v | grep --color ^S"'

# https://stackoverflow.com/a/59912825/4233593
alias git-prune-local="git fetch --all -p && git branch -vv | grep ': gone]' | awk '{print \$1}' | xargs git branch -D"

# reset to remote
alias rr='git reset --hard "$(git rev-parse --abbrev-ref --symbolic-full-name @{u})"'
alias rh='git reset --hard'

# copy modified
alias cpd="git ls-files -m -o --exclude-standard | tr '\n' ' ' | cpy"

# tab completion
# http://stackoverflow.com/a/15009611/4233593
alias g='git'
__git_complete g __git_main
alias gc='git clone'
alias f='git fetch --prune'
__git_complete f _git_fetch
alias mnf='git merge --no-ff'
__git_complete mnf _git_merge
alias pl='git pull --prune --rebase=merges'
__git_complete pl _git_pull
alias ph='git push'
__git_complete ph _git_push
alias d='git diff -p --stat'
__git_complete d _git_diff
alias dc='git diff -p --stat --cached'
__git_complete dc _git_diff
alias dm='git difftool -t meld'
__git_complete dm _git_diff
alias dmc='git difftool -t meld --cached'
__git_complete dmc _git_diff
alias co='git checkout'
__git_complete co _git_checkout
alias r='git reset'
__git_complete r _git_reset
alias cm='git commit'
__git_complete cm _git_commit
alias st='git stash'
__git_complete st _git_stash
alias show='showl --patch'
__git_complete show _git_show
alias showl='git show --stat --summary'
__git_complete showl _git_show
alias showm='git showm'
__git_complete showm _git_show

alias gl="git log --graph --format='%C(green)%as %C(auto)%h%d %C(bold blue)%an %C(auto)%s'"
alias la='gl --all'
__git_complete gl _git_log
function le()
{
    gl "$@" --color | emojify | less -R
}
__git_complete le _git_log
alias b='git branch'
__git_complete b _git_branch
alias bv='git branch -vv'
alias ba='git branch -avv'
alias bg='ba | grep'
alias skpd='git ls-files -v | grep --color "^S"'

# scripts
alias gup="$prefage_directory/git/upstream.clone.bash"

# delete merged branches local & remote
# http://stackoverflow.com/a/6127884/4233593
# http://stackoverflow.com/a/8229823/4233593
git_clean_merged_remote(){
	if [ -z $1 ]; then echo "error: remote required"; return; fi
	if [ -z $2 ]; then echo "error: branch required"; return; fi
	git branch -a --merged remotes/$1/$2 | grep -v "HEAD\|master\|dev\|develop\|$2" | grep "remotes/$1/" | cut -d "/" -f 3 | xargs -r git push --delete $1
}
alias gcr='git_clean_merged_remote'
__git_complete gcr _git_pull

git_clean_merged_local(){
	if [ -z $1 ]; then echo "error: branch required"; return; fi
	git branch --merged | egrep -v "(^\*|master|dev|develop|$1)" | xargs git branch -d
}
alias gcl='git_clean_merged_local'
__git_complete gcl _git_checkout

git_clean_merged_all(){
    gcr "$1" "$2"
    gcl "$2"
}
alias gca="git_clean_merged_all"
__git_complete gca _git_pull

alias committers='git log --format=fuller | grep -E "^(Author:|Commit:)" | sort | uniq'

alias anonymize_git_branch='git filter-branch -f --env-filter "
    GIT_AUTHOR_NAME=$(tr -dc [:lower:][:digit:] < /dev/urandom | head -c 40)
    GIT_AUTHOR_EMAIL=$(tr -dc [:lower:][:digit:] < /dev/urandom | head -c 40)
    GIT_COMMITTER_NAME=$(tr -dc [:lower:][:digit:] < /dev/urandom | head -c 40)
    GIT_COMMITTER_EMAIL=$(tr -dc [:lower:][:digit:] < /dev/urandom | head -c 40)
" HEAD'
