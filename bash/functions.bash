# thanks vivek@nixCraft
# http://www.cyberciti.biz/faq/linux-random-password-generator/
genpasswd() {
	local l=$1
	[ "$l" == "" ] && l=16
	tr -dc \\050-\\172 < /dev/urandom | head -c ${l} | xargs
}
