#!/bin/bash

# Paste xdebug settings in primary php.ini
# so they will always be loaded by default.
# You can find this with command `php --ini`
# which shows "Loaded Configuration File:"
# Delete the symlink for xdebug.ini from the
# "Scan for additional .ini files in:" directory.

if $(command -v composer >/dev/null 2>&1); then
	alias c='composer';
	alias cda="c dumpautoload"
	export PATH="$HOME/.config/composer/vendor/bin:$HOME/.composer/vendor/bin:$PATH";
fi
