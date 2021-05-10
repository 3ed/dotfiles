xidletime_timer() {
	local auto_poweroff_timeout=45

	perl -MX11::IdleTime -e '
		$| = 1;
		my %pb = ( max => 7, current => 0, backward => 0 ); # TODO do it on: $timeout % $max

		while (1) {
			my $timeout = $ARGV[1] * 60 - GetIdleTime();
			my @h_timeout = (int($timeout / 60), $timeout % 60);

			$pb{backward} = 1 if ($pb{current} ge $pb{max});
			$pb{backward} = 0 if ($pb{current} le 0);

			$pb{string} = sprintf("[%s=%s]", (" " x $pb{current}), (" " x ($pb{max} - $pb{current})));

			if ($pb{backward}) { $pb{current}-- }
			else { $pb{current}++ };

			printf(
				"%s: %02d min %02d sec  %s   \r",
				$ARGV[0],
				@h_timeout,
				$pb{string}
			);

			if ($timeout gt 0) {
				sleep 1;
			} else {
				exit 0;
			}
		}' "${1:-"Odliczanie"}" "${2:-$auto_poweroff_timeout}"
}

auto_poweroff() {
	xidletime_timer "Pozostały czas do wyłączenia" "$@" \
		&& systemctl poweroff
}

auto_suspend() {
	xidletime_timer "Pozostały czas do uśpienia" "$@" \
		&& systemctl suspend
}
