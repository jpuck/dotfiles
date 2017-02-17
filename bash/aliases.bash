# list
alias l='ls -lah --time-style="+%Y-%m-%d %a %T"'
# list sort by time
alias lt='l -tr'
# list files
# http://unix.stackexchange.com/a/116524/148062
alias lf='l -p --color=always | grep -v /'
# list files sort by time
alias lft='l -ptr --color=always | grep -v /'
# list full path filename
alias lsf='readlink --canonicalize'

# show every users crontab
alias crontaball="cat /etc/passwd | sed 's/^\([^:]*\):.*$/sudo crontab -u \1 -l 2>\&1/' | sh | grep -v 'no crontab for'"

# npm execute
# http://stackoverflow.com/a/15157360/4233593#how-to-use-package-installed-locally-in-node-modules
alias nexec='PATH=$(npm bin):$PATH'
alias asr='sudo service apache2 reload'
alias tre="tree -a -I 'vendor|node_modules|nbproject|coverage|.git'"
alias trel="tre -C | less -R"
alias tred="tre -d"
alias tref="tre -f"
alias o='xdg-open'
alias brw='byzanz-record-window'

# laravel
alias art='php artisan'
alias artt='art tinker'
alias vw='tre resources/views'
alias rl='art route:list'

alias t='phpunit'
alias tt='phpunit --testdox'
alias ttt='phpunit --debug'
alias k='kate'
alias less='less --tabs=4'
alias myr='mysql -u root -p'

# date time
alias ct='TZ=America/Chicago date "+%I:%M %p"'

# make a file and any folders along the way
alias mk='install -m=664 -b -D /dev/null'
# make an executable and any folders along the way
alias mkx='install -b -D /dev/null'
# make a folder and any folders along the way
alias mkd='mkdir -p'
# remove directory
alias rd='rm -rf'

# delete trailing spaces from a file
# http://stackoverflow.com/a/20521936/4233593
alias deltrailspaces="sed -i 's/\s*$//'"

# view coverage
alias vc='php -S localhost:8080 -t coverage/'

# save change directory
alias cds='alias cdb="cd $(pwd)"'

# copy-paste x-clip
# apt-get install xclip
# http://stackoverflow.com/a/27456981/4233593
alias setclip='xclip -selection c'
alias getclip='xclip -selection clipboard -o'

# get user path for sudo
# http://stackoverflow.com/a/29400598/4233593
alias mysudo='sudo -E env "PATH=$PATH"'

# requires xclip
alias cpy='xclip -selection clipboard'

# requires PHP_CodeSniffer
# https://github.com/squizlabs/PHP_CodeSniffer
alias pcs='phpcs -s --colors --standard=PSR2 --report-width=auto'

alias phpspec='vendor/bin/phpspec'
alias phpunit='./vendor/bin/phpunit'
