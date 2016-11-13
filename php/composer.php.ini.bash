#!/bin/bash

# Paste xdebug settings in primary php.ini
# so they will always be loaded by default.
# You can find this with command `php --ini`
# which shows "Loaded Configuration File:"
# Delete the symlink for xdebug.ini from the
# "Scan for additional .ini files in:" directory.

which_composer="$(which composer)";
if [ -n "$which_composer" ]; then
	composer_php_ini="$prefage_directory/php/composer.php.ini";
	current_php_ini="$(php --ini | grep 'Loaded Configuration File:' | awk '{print $4}')";
	cat "$current_php_ini" | grep -v xdebug > "$composer_php_ini";
	alias c="php -c '$composer_php_ini' '$which_composer'";
	alias cda="c dumpautoload"
	export PATH="$PATH:$HOME/.composer/vendor/bin";
fi
