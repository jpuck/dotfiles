# move to working directory
export prefage_directory=$( cd $( dirname "${BASH_SOURCE[0]}" ) && cd .. && pwd)

. $prefage_directory/bash/ubuntu14.04-bashrc.bash
. $prefage_directory/bash/aliases.bash
. $prefage_directory/bash/colors.bash
. $prefage_directory/bash/functions.bash
. $prefage_directory/git/functions.bash

if $(command -v git >/dev/null 2>&1); then
   . $prefage_directory/git/completion.bash
	. $prefage_directory/git/prompt.sh

	# Change command prompt
	export GIT_PS1_SHOWDIRTYSTATE=1
	# '\u' adds the name of the current user to the prompt
	# '\h' adds the name of the host
	# '\W' adds the name of the current directory
	# '\$(__git_ps1)' adds git-related stuff

	# host color can be overridden in host-color.bash
	host_color=$green
	if [ -f $prefage_directory/bash/host-color.bash ]; then
		source $prefage_directory/bash/host-color.bash
	fi

	export PS1="$(if [[ $EUID -eq 0 ]]; then echo $red; else echo $lime; fi)\u$darkgraylight@$host_color\h $bluebright$(if [[ $EUID -eq 0 ]]; then echo \\w; else echo \\W; fi)$green\$(__git_ps1) $lime$ $reset"

fi

# include composer globals
export PATH="~/.composer/vendor/bin:$PATH"

# Load xdebug Zend extension with php command
alias php='php -dzend_extension=xdebug.so'
# PHPUnit needs xdebug for coverage. In this case, just make an alias with php command prefix.
alias phpunit='php $(which phpunit)'
