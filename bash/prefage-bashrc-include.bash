# move to working directory
export prefage_directory=$( cd $( dirname "${BASH_SOURCE[0]}" ) && cd .. && pwd)

. $prefage_directory/bash/ubuntu14.04-bashrc.bash
. $prefage_directory/bash/aliases.bash
. $prefage_directory/bash/colors.bash

if $(command -v git >/dev/null 2>&1); then
   . $prefage_directory/git/completion.bash
	. $prefage_directory/git/prompt.sh

	# Change command prompt
	export GIT_PS1_SHOWDIRTYSTATE=1
	# '\u' adds the name of the current user to the prompt
	# '\h' adds the name of the host
	# '\W' adds the name of the current directory
	# '\$(__git_ps1)' adds git-related stuff

	export PS1="$(if [[ $EUID -eq 0 ]]; then echo $red; else echo $lime; fi)\u$darkgraylight@$green\h $bluebright\W$green\$(__git_ps1) $lime$ $reset"

fi
