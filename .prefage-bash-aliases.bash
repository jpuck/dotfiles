alias l='ls -la'
alias c='clear'
alias g='git'
alias alog='sudo cat /var/log/apache2/access.log'
alias elog='sudo cat /var/log/apache2/error.log'
alias crontaball="cat /etc/passwd | sed 's/^\([^:]*\):.*$/sudo crontab -u \1 -l 2>\&1/' | sh | grep -v 'no crontab for'"
