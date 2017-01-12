# http://www.cyberciti.biz/faq/linux-random-password-generator/
# WARNING: On a multiuser Linux system
# everyone can see your password
# by looking at the process list.
# https://tech.slashdot.org/comments.pl?sid=2679771&cid=39091343
genpasswd() {
	local length="$1"
	[ "$length" == "" ] && length=16
	# dash is escaped \-
	tr -dc [:alpha:][:digit:]'{[(</|>)]}~!@#^&\-_=+;:,.?' < /dev/urandom | head -c "$length"
	echo
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
