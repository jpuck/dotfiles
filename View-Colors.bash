#!/bin/bash

#
# This file echoes a bunch of color codes to the terminal to demonstrate
# what's available. Each line is the color code of one forground color,
# out of 17 (default + 16 escapes), followed by a test use of that color
# on all nine background colors (default + 8 escapes).
#

echo "basic colors:"

for FG in 30 31 32 33 34 35 36 37; do
  for BG in 40 41 42 43 44 45 46 47; do
    echo -en " \033[0;$FG;${BG}m 0;$FG;${BG}m \033[1;$FG;${BG}m 1;$FG;${BG}m \033[0m";
  done
  echo
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

for FG in {16..255}; do
  echo -e "\033[0;38;5;${FG}m0;38;5;${FG}m \033[1;38;5;${FG}m1;38;5;${FG}m"
done

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

[[ $1 ]] && username_color=$1 || username_color="\033[0;32m"
[[ $2 ]] && hostname_color=$2 || hostname_color="\033[0;31m"

echo '
for PS1 variable use,
need to wrap in escaped square brackets: \[ color \]
example:
green="\[\033[0;32m\]"
red="\[\033[0;31m\]"
reset="\[\033[0m\]"

so for green username with red hostname and everything else normal,
line in ~/.bashrc would be:
export PS1="$green\u$reset @ $red\h$reset $"

this example is printed below, but you can also pass the username
and hostname colors to this script as parameters 1 & 2
'
echo -e "$username_color$(whoami)\033[0m @ $hostname_color$(hostname)\033[0m $
"
