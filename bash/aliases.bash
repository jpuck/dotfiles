# list
alias l='ls -lah --time-style="+%Y-%m-%dT%T %a"'
# list sort by time
alias lt='l -tr'
# list files
# http://unix.stackexchange.com/a/116524/148062
alias lf='l -p --color=always | grep -v /'
# list files sort by time
alias lft='l -ptr --color=always | grep -v /'
# list full path filename
alias lsf='readlink --canonicalize'
alias rmtorr='rd ~/Downloads/torr/*'
alias tre="tree -aC -I 'vendor|node_modules|nbproject|coverage|.git|storage|.idea|.DS_Store'"
alias trel="tre -C | less -R"
alias tred="tre -d"
alias tref="tre -f"

# show every users crontab
alias crontaball="cat /etc/passwd | sed 's/^\([^:]*\):.*$/sudo crontab -u \1 -l 2>\&1/' | sh | grep -v 'no crontab for'"

# npm execute
# http://stackoverflow.com/a/15157360/4233593#how-to-use-package-installed-locally-in-node-modules
alias nx='PATH=$(npm bin):$PATH'
alias build='npm run build'
alias webpack='npx webpack'
alias asr='sudo service apache2 reload'
alias o='xdg-open'
alias brw='byzanz-record-window'
alias nt='npm run test'

# mysql
# copy pager command for horizontal scrolling
alias mysqlpager='echo "pager less -SFX -# 10" | cpy'

alias at='atom -a .'
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

# save change directory
alias cds='alias cdb="cd "$(pwd)""'
alias cdb='cds'

# copy print working directory
alias cpwd='echo -n "$PWD" | cpy'

# copy-paste x-clip
# apt-get install xclip
# http://stackoverflow.com/a/27456981/4233593
alias setclip='xclip -selection c'
alias getclip='xclip -selection clipboard -o'

# get user path for sudo
# http://stackoverflow.com/a/29400598/4233593
alias mysudo='sudo -E env "PATH=$PATH"'
alias nohist='unset HISTFILE'

# requires xclip
alias cpy='xclip -selection clipboard'

alias guetzli='docker run --rm -it -v $PWD:/guetzli fabiang/guetzli'
alias sci='ssh-copy-id -i ~/.ssh/id_rsa.pub'

alias dcompose='docker-compose'

alias upd='pref && pl && cd - && sudo apt update && apt list --upgradable'

alias upg='sudo apt auto-remove -y && sudo apt upgrade -y'
