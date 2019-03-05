export TZ=UTC

# move to working directory
export prefage_directory=$( cd $( dirname "${BASH_SOURCE[0]}" ) && cd .. && pwd)
alias pref="cd $prefage_directory"

. $prefage_directory/bash/ubuntu14.04-bashrc.bash
. $prefage_directory/bash/aliases.bash
. $prefage_directory/bash/colors.bash
. $prefage_directory/bash/functions.bash
. $prefage_directory/php/composer.php.ini.bash

export PATH="$prefage_directory/bin:$PATH"

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

	# host & user color can be overridden in host-color.bash
	host_color=$green
	user_color=$lime
	if [ -f $prefage_directory/bash/host-color.bash ]; then
		source $prefage_directory/bash/host-color.bash
	fi

	export PS1="$darkgraylight\D{%H:%M:%S} $(if [[ $EUID -eq 0 ]]; then echo $red; else echo $user_color; fi)\u$darkgraylight@$host_color\h $bluebright$(if [[ $EUID -eq 0 ]]; then echo \\w; else echo \\W; fi)$green\$(__git_ps1) $lime\! $reset"

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

# DO THIS LAST to keep clean console on launch
# get timestamp at command execute
# http://unix.stackexchange.com/a/304270/148062
trap 'echo -e "\033[38;5;239m$(date +%H:%M:%S)\033[0m"' DEBUG
