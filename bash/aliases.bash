alias l='ls -la --time-style="+%Y-%m-%d %a %T"'
alias crontaball="cat /etc/passwd | sed 's/^\([^:]*\):.*$/sudo crontab -u \1 -l 2>\&1/' | sh | grep -v 'no crontab for'"
# http://stackoverflow.com/a/15157360/4233593#how-to-use-package-installed-locally-in-node-modules
alias nexec='PATH=$(npm bin):$PATH'
alias asr='sudo service apache2 restart'
alias tre="tree -I 'vendor|node_modules|nbproject|coverage'"
alias o='xdg-open'
alias brw='byzanz-record-window'
alias art='php artisan'
alias pu='phpunit'
alias k='kate'
alias less='less --tabs=4'
alias mk='install -m=664 -b -D /dev/null'
alias mkx='install -b -D /dev/null'
alias mkd='mkdir -p'
alias rd='rm -rf'
