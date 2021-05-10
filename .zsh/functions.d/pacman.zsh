R() {
	if [ -z "$1" ]; then return 0; fi

	local pkgs=( $(
		pacman \
			-Qqs \
			"$1" \
		| fzf \
			-m \
			--header="==> Wybierz pojedyńczą pozycję lub zaznacz wiele za pomocą [tab]. Potwierdź: [enter]. Wyjdź: [ctrl+c]."
	) )

	if [ "${#pkgs}" -gt "0" ]; then
		sudo pacman -Rscn "${pkgs[@]}"
	fi
}

mksrcinfo() {
  test -f 'PKGBUILD' && makepkg --printsrcinfo > .SRCINFO
}


### --- AUR helper --- ###

Ma() {
  local -a MAKEPKG_OPTS PACKAGES

  local BUILDDIR="${BUILDDIR:-"$AURPAC_DIR/build/"}"
  local SRCDEST="${SRCDEST:-"$AURPAC_DIR/src/"}"
  local PKGDEST="${PKGDEST:-"$AURPAC_DIR/pkg/"}"
  local SRCPKGDEST="${SRCPKGDEST:-"$AURPAC_DIR/srcpkg/"}"

  install -dm755 "$BUILDDIR" "$SRCDEST" "$PKGDEST" "$SRCPKGDEST"

  while [ -n "$1" ]; do
    if [ "${1:0:1}" = "-" ]; then
      MAKEPKG_OPTS+=($1)
    else
      PACKAGES+=($1)
    fi
    shift
  done

  if [ "${#PACKAGES[@]}" = "0" ]; then
    (
      for i in "$BUILDDIR"/*
      do test -d "$i" && cd "$i" && \
        BUILDDIR="$BUILDDIR" \
        SRCDEST="$SRCDEST" \
        PKGDEST="$PKGDEST" \
        SRCPKGDEST="$SRCPKGDEST" \
        PKGEXT='.pkg.tar' \
        makepkg "${MAKEPKG_OPTS[@]}"
      done
    )
  else
    (
      for i in "${PACKAGES[@]}"
      do test -d "$BUILDDIR/$i" && cd "$BUILDDIR/$i" && \
        BUILDDIR="$BUILDDIR" \
        SRCDEST="$SRCDEST" \
        PKGDEST="$PKGDEST" \
        SRCPKGDEST="$SRCPKGDEST" \
        PKGEXT='.pkg.tar' \
        makepkg "${MAKEPKG_OPTS[@]}"
      done
    )
  fi
}

Mac() {
  local BUILDDIR="${BUILDDIR:-"$AURPAC_DIR/build/"}"
  local PKGDEST="${PKGDEST:-"$AURPAC_DIR/pkg/"}"

  test -d "$BUILDDIR" && rm -rf "$BUILDDIR"
  test -d "$PKGDEST"  && rm -rf "$PKGDEST"

  install -dm755 "$BUILDDIR" "$PKGDEST"
}

Macc() {
    if [ -n "$AURPAC_DIR" ] && [ -d "$AURPAC_DIR" ]; then
        echo ":: Usuwanie plików z $AURPAC_DIR"
        echo
        echo -n "[ctrl+c] aby przerwać, [enter] aby kontynuować..."
        if read; then
            rm -rf "$AURPAC_DIR"
            Ma
        fi
    fi
}