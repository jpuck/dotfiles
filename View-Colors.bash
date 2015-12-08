#!/bin/bash

#
# This file echoes a bunch of color codes to the terminal to demonstrate
# what's available. Each line is the color code of one forground color,
# out of 17 (default + 16 escapes), followed by a test use of that color
# on all nine background colors (default + 8 escapes).
#

echo "basic colors:"

T='gYw'   # The test text
echo -e "\n                 40m     41m     42m     43m     44m     45m     46m     47m";
for FGs in '    m' '   1m' '  30m' '1;30m' '  31m' '1;31m' '  32m' '1;32m' '  33m' '1;33m' '  34m' '1;34m' '  35m' '1;35m' '  36m' '1;36m' '  37m' '1;37m';
  do FG=${FGs// /}
  echo -en " $FGs \033[$FG  $T  "
  for BG in 40m 41m 42m 43m 44m 45m 46m 47m;
    do echo -en "$EINS \033[$FG\033[$BG  $T \033[0m\033[$BG \033[0m";
  done
  echo;
done
echo


#
# generates an 8 bit color table (256 colors) for
# reference purposes, using the \033[48;5;${val}m
# ANSI CSI+SGR (see "ANSI Code" on Wikipedia)
# http://bitmote.com/index.php?post/2012/11/19/Using-ANSI-Color-Codes-to-Colorize-Your-Bash-Prompt-on-Linux
#

echo "256 colors:"

echo -en "\n   +  "
for i in {0..35}; do
  printf "%2b " $i
done

printf "\n\n %3b  " 0
for i in {0..15}; do
  echo -en "\033[48;5;${i}m  \033[m "
done

#for i in 16 52 88 124 160 196 232; do
for i in {0..6}; do
  let "i = i*36 +16"
  printf "\n\n %3b  " $i
  for j in {0..35}; do
    let "val = i+j"
    echo -en "\033[48;5;${val}m  \033[m "
  done
done

echo -e "\n"

echo 'special sequence to initiate prompt color change: \033[
m: terminate
separate values with ;
0: normal
1: bright
30-37: foreground
40-47: background'

echo '
example:
echo -e "testing \033[0;30;41m COLOR1 \033[1;35;44m COLOR2 \033[m"'
echo -e "testing \033[0;30;41m COLOR1 \033[1;35;44m COLOR2 \033[m"

echo '
for 256 colors,
38;5;number foreground
48;5;number background
number = row number + column number

example:
echo -e "testing \033[38;5;226m SUPER YELLOW \033[m"'
echo -e "testing \033[38;5;226m SUPER YELLOW \033[m"
echo '
echo -e "testing \033[38;5;226;48;5;17m SUPER YELLOW ON DEEP BLUE \033[m"'
echo -e "testing \033[38;5;226;48;5;17m SUPER YELLOW ON DEEP BLUE \033[m"

echo '
for PS1 variable use,
need to wrap in escaped square brackets: \[ color \]
example:
green="\[\033[0;32m\]"
red="\[\033[0;31m\]"
reset="\[\033[0m\]"

so for green username with red hostname and everything else normal,
line in ~/.bashrc would be:
export PS1="$green\u $reset@ $red\h $reset$"
'
echo -e "\033[0;32musername\033[0m@\033[0;31mhostname\033[0m$"
