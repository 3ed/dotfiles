http-py() {
	echo "URL: http://127.0.0.1:${1:-8000}/"
	python3 -m http.server "${1:-8000}"
}

http-plack() {
	plackup \
		-MPlack::App::Directory \
		-e 'Plack::App::Directory->new(root=>".");' \
		-p "${1:-8000}"
}

http-hypno() {
    ~/Skrypty/hypnoserv.pl
}