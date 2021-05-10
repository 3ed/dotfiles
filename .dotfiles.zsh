#!/usr/bin/zsh
# curl -L "<git url here>" | exec zsh

GITREPO="/home/test/dotfiles/.dotfiles"

msg() {
	printf "\e[32;1m==> \e[0;1m%s...\e[0m\n" "$1"
}

cd "$HOME" || exit 1

msg "Installing dotfiles"
if [ ! -d ".dotfiles" ]; then
	git clone --bare "$GITREPO" "$HOME/.dotfiles"

	git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME \
		config --local status.showUntrackedFiles no

	git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME \
		checkout

	echo done
fi

msg "Installing zinit"
if [ ! -d ".zinit" ]; then
	mkdir .zinit
	git clone https://github.com/zdharma/zinit.git .zinit/bin

	echo done
fi

msg "Installing neovim-plug"
curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

msg "Installing perls cpanminus, local::lib"
if [ ! -d "perl5" ]; then
	curl -L https://cpanmin.us | perl - App::cpanminus

	echo done
fi

cat <<'EOF'

-----------------------
Instalation is complete
-----------------------

1. Type:  exec zsh
2. Hit:   enter
3. Have:  fun!

-----------------------

EOF
