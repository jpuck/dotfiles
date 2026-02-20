export TZ=America/New_York
export HISTTIMEFORMAT="%FT%T "

# move to working directory
export prefage_directory=$( cd $( dirname "${BASH_SOURCE[0]}" ) && cd .. && pwd)
alias pref="cd $prefage_directory"

. $prefage_directory/bash/ubuntu14.04-bashrc.bash
. $prefage_directory/bash/aliases.bash
. $prefage_directory/bash/colors.bash
. $prefage_directory/bash/functions.bash
. $prefage_directory/php/composer.php.ini.bash

export PATH="$prefage_directory/bin:$PATH"
export PATH=$HOME/.local/bin:$PATH

if $(command -v git >/dev/null 2>&1); then
	. $prefage_directory/git/completion.bash
	. $prefage_directory/git/prompt.sh
	. $prefage_directory/git/functions.bash
	. $prefage_directory/git/aliases.bash

	# Change command prompt
	export GIT_PS1_SHOWDIRTYSTATE=1
	# '\u' adds the name of the current user to the prompt
	# '\h' adds the name of the host
	# '\W' adds the name of the current directory
	# '\$(__git_ps1)' adds git-related stuff

        if [ -z "$HOSTNAME_COLOR" ]; then
            HOSTNAME_COLOR=$green
        fi
        if [ -z "$USERNAME_COLOR" ]; then
            USERNAME_COLOR=$lime
        fi

	export PS1="$darkgraylight\D{%H:%M:%S} $bluebright$(if [[ $EUID -eq 0 ]]; then echo \\w; else echo \\W; fi)$green\$(__git_ps1) $lime\! $reset"

fi

if $(command -v php >/dev/null 2>&1); then
    . "$prefage_directory"/php/aliases.bash
    export PATH="$prefage_directory/tools:$PATH"
fi

# set tab width
tabs -4

# trump with any local aliases
if [ -f ~/.aliases.bash ]; then
    . ~/.aliases.bash
fi

# node version manager
# https://github.com/nvm-sh/nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
