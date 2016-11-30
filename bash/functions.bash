# http://www.cyberciti.biz/faq/linux-random-password-generator/
# WARNING: On a multiuser Linux system
# everyone can see your password
# by looking at the process list.
# https://tech.slashdot.org/comments.pl?sid=2679771&cid=39091343
genpasswd() {
	local l=$1
	[ "$l" == "" ] && l=16
	tr -dc [:alpha:][:digit:]'{[(</|>)]}~!@#%^&*\-_=+;:,.?' < /dev/urandom | head -c ${l} | xargs
}

# NOTE: does not count newlines
strlen() {
	echo -n "$1" | wc -m
}
