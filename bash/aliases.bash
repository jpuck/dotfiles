alias l='ls -la'
alias c='clear'
alias crontaball="cat /etc/passwd | sed 's/^\([^:]*\):.*$/sudo crontab -u \1 -l 2>\&1/' | sh | grep -v 'no crontab for'"
alias glg="git log --graph --oneline --decorate --all"
