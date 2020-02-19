# http://www.cyberciti.biz/faq/linux-random-password-generator/
# WARNING: On a multiuser Linux system
# everyone can see your password
# by looking at the process list.
# https://tech.slashdot.org/comments.pl?sid=2679771&cid=39091343
genpasswd() {
    # option -n (do not echo newline after password)
    # optional argument 1 (length of password)
    local OPTIND option newline=1
    while getopts "n" option; do
        case "$option" in
            n)
                newline=0
                ;;
        esac
    done
    shift $((OPTIND-1))

    local length="$1"
    [ "$length" == "" ] && length=16
    # dash is escaped \-
    # no backslash \ as escape sequence
    # no quotes ' " ` for breaking quotations
    # no space for unquotable systems
    # no percent % for sprintf
    # no dollar $ for php
    # no hash # equals = or colon : for ssmtp http://serverfault.com/q/826875/331028
    # no asterix * for globbing
    tr -dc [:alpha:][:digit:]'{[(</|>)]}~!@^&\-_+;,.?' < /dev/urandom | head -c "$length"

    (($newline)) && echo
}

genpasswdc() {
    genpasswd -n "$1" | xclip -selection clipboard
}

# NOTE: does not count newlines
strlen() {
	echo -n "$1" | wc -m
}

# http://stackoverflow.com/a/5349842/4233593
# http://stackoverflow.com/a/5303675/4233593
printn() {
    local chars="$2"
    [ "$chars" == "" ] && chars="a"
    printf "$chars%.0s" $(eval echo "{1..$1}")
    echo
}

cpk() {
    cp "$1" "$2"
    k "$2"
}

mkk() {
    mk "$1"
    k "$1"
}

mkxk() {
    mkx "$1"
    k "$1"
}

function mkdir_for_files(){
    for fullfile in `run-parts --list --regex . "$1"`; do
        directory=$(dirname "$fullfile")
        filename=$(basename "$fullfile")
        name="${filename%.*}"
        mkdir "$directory/$name"
    done
}

function lessjson() {
    jq -C . "$1" | less -R
}

function jcurl() {
    curl -H 'Content-Type: application/json' -H 'Accept: application/json' "$@" | lessjson -
}

function stop()
{
    docker-compose stop $1 && docker-compose rm -f $1
}
