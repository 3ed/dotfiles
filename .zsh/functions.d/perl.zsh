perlmod() {
	perldoc -m -- "$@" | highlight --out-format=xterm256 --syntax=perl | less -r
}

perlwhich() { 
	perl -E 'my @m = split q{::}, qq{$ARGV[0].pm}; for (@INC) { my $p = join q{/}, $_, @m; if (-f $p) { say $p; exit 0 } }; exit 1' -- $1;
}