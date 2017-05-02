# laravel
alias art='php artisan'
alias artt='art tinker'
alias vw='tre resources/views'
alias rl='art route:list'
alias ms='art migrate:status'
alias m='art migrate'

# testing
alias t='docker run --rm -it -v "$PWD":/code gpgl/test-core'
alias tt='t ./vendor/bin/phpunit --testdox'
alias ttt='t ./vendor/bin/phpunit --debug'
alias phpspec='vendor/bin/phpspec'
alias dusk='art dusk --stop-on-failure'
