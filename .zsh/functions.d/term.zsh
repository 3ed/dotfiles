color() {
	perl -MTerm::ANSIColor=color -E 'print color(@ARGV)' -- "$@"
}

colorstrip() {
	perl -MTerm::ANSIColor=colorstrip -E 'print colorstrip(<<>>)' -- "$@"
}

hr() {
    perl -e 'print ($ARGV[0] x $ARGV[1])' -- ${1:-"="} `tput cols`
}