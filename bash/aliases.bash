alias l='ls -la --time-style="+%Y-%m-%d %a %T"'
alias c='clear'
alias crontaball="cat /etc/passwd | sed 's/^\([^:]*\):.*$/sudo crontab -u \1 -l 2>\&1/' | sh | grep -v 'no crontab for'"
alias glg="git log --graph --oneline --decorate --all"
alias gpom="git push origin master"
alias gup="~/prefage/git/upstream.clone.bash"
# http://stackoverflow.com/questions/9679932/how-to-use-package-installed-locally-in-node-modules
alias npm-exec='PATH=$(npm bin):$PATH'
