# laravel
alias art='php artisan'
alias artt='art tinker'
alias vw='tre resources/views'
alias rl='art route:list'
alias ms='art migrate:status'
alias m='art migrate'

# testing
alias phpunit='docker run --rm -it -v "$PWD":/code gpgl/test-core ./vendor/bin/phpunit'
alias t='phpunit'
alias tt='phpunit --testdox'
alias ttt='phpunit --debug'
alias phpspec='vendor/bin/phpspec'
alias dusk='art dusk --stop-on-failure'
