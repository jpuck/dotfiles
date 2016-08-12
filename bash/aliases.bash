alias l='ls -la --time-style="+%Y-%m-%d %a %T"'
alias crontaball="cat /etc/passwd | sed 's/^\([^:]*\):.*$/sudo crontab -u \1 -l 2>\&1/' | sh | grep -v 'no crontab for'"
alias gup="~/prefage/git/upstream.clone.bash"
# http://stackoverflow.com/a/15157360/4233593#how-to-use-package-installed-locally-in-node-modules
alias nexec='PATH=$(npm bin):$PATH'
alias asr='sudo service apache2 restart'
alias tree="tree -I 'vendor|node_modules'"
alias o='xdg-open'
alias brw='byzanz-record-window'
