if [ -f ~/.prefage-bash-ubuntu14.04.bash ]; then
    . ~/.prefage-bash-ubuntu14.04.bash
fi

if [ -f ~/.prefage-bash-aliases.bash ]; then
    . ~/.prefage-bash-aliases.bash
fi

if [ -f ~/.prefage-bash-colors.bash ]; then
    . ~/.prefage-bash-colors.bash
fi

if [ -f ~/.prefage-git-completion.bash ]; then
    . ~/.prefage-git-completion.bash
fi

if [ -f ~/.prefage-git-prompt.sh ]; then
    . ~/.prefage-git-prompt.sh
	# Change command prompt
	export GIT_PS1_SHOWDIRTYSTATE=1
	# '\u' adds the name of the current user to the prompt
	# '\h' adds the name of the host
	# '\W' adds the name of the current directory
	# '\$(__git_ps1)' adds git-related stuff
	export PS1="$lime\u$darkgraylight@$green\h $bluebright\W$green\$(__git_ps1) $lime$ $reset"
fi
