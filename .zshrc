# ~/.zshrc - konfuguracja shella

#-------------------------------------------------------------------------------
# Ścieżki makepkg
#-------------------------------------------------------------------------------
# Pliki źródłowe projektów
export SRCDEST="/var/tmp/aurpac-$USER/src/"
# Pakiety binarne pacmana
export PKGDEST="/var/tmp/aurpac-$USER/pkg/"
# Pakiety źródłowe pacmana
export SRCPKGDEST="/var/tmp/aurpac-$USER/srcpkg/"
# Katalog budowy pakietów (coś jak tmp, chyba że używasz ccache)
#export   BUILDDIR="/var/tmp/aurpac-$USER/build/"
# Fallback dla aurpaca
export AURPAC_DIR="/var/tmp/aurpac-$USER/"
#-------------------------------------------------------------------------------

if [[ "$TERM" =~ 256 ]]; then
	xterm_colors_print () {
		local cols=$[`tput cols` - 30]
		local y="`printf %${cols:-60}s`"
		local -i i
		for ((i=0 ; i <= 255; i++))
		do
			printf "%-14s\e[38;5;${i}mtext color and \e[0m" "\e[38;5;${i}m"
			printf "\e[48;5;${i}m%s\e[0m\n" "$y"
		done
	}
#else
	# TODO: 8 kolorowy shell...
	# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bg=cyan,bold,underline"
fi

# pluginy
source ~/.zinit/bin/zinit.zsh

# dopełniacz
zstyle :compinstall filename '~/.zshrc'
autoload -Uz compinit && compinit

# moduły
autoload -U zcalc

# kolory LS_COLORS
eval `dircolors -b`
export GREP_COLOR="1;33"

# podstawowe style dla dopełniacza
#zstyle ':completion:*' list-prompt '%SPozycja %p: Wciśnij TAB by pójść dalej lub zacznij pisać..%s'
zstyle ':completion:*' menu yes select=1 _complete _correct _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric
zstyle ':completion:*' verbose yes

# kolory dopełniacza
highlights='${PREFIX:+=(#bi)($PREFIX:t)(?)*==32=1;33}':${(s.:.)LS_COLORS}}
zstyle -e ':completion:*' list-colors 'reply=( "'$highlights'" )'
unset highlights

# dodatkowe style dla dopełniacza
zstyle ':completion:*:processes' command 'pgrep -l -u ${USER}'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;33'
zstyle ':completion:*:*:kill:*:argument-rest' list-colors "="

zstyle ':completion:*:processes-names' command 'ps xw -ocmd=|grep -v "ps xw -ocmd="'

zstyle ':completion:*:descriptions' format '%B-- %d --%b'
zstyle ':completion:*:warnings' format '%BBrak pasujących elementów..%b'
zstyle ':completion:*:corrections' format $'%{\e[0;31m%}%d (błędy: %e)%}'
zstyle ':completion:*:messages' format '%d'
## cd nigdy nie wyświetla katalogów rodziców (gdy: cd ../<TAB>):
zstyle ':completion:*:cd:*' ignore-parents parent pwd
## dodaje sekcje jak 1,2,3,..,all - prawdopodobnie bezużyteczne
## ale pomaga zapamiętać różnice między sekcjami
zstyle ':completion:*:man:*' separate-sections true

# inne style
zstyle ':mime:.txt:' handler vim %s

# Podstwowe opcje shella
HISTFILE=~/.zsh_history
HISTSIZE=3000
SAVEHIST=3000
setopt autocd beep nomatch notify hist_ignore_all_dups CORRECT AUTO_PARAM_KEYS \
			 LIST_TYPES interactive interactive_comments COMPLETE_ALIASES CHECK_JOBS
#unsetopt appendhistory extendedglob

# Nobody need flow control anymore. Troublesome feature.\n stty -ixon
setopt noflowcontrol

bindkey -e

autoload -z edit-command-line
zle -N edit-command-line
bindkey "" edit-command-line

_widget-historyfuzzy() {
	BUFFER="$( fzf --tac < ~/.zsh_history )"
	CURSOR=$#BUFFER
}
zle -N _widget-historyfuzzy
bindkey "" _widget-historyfuzzy

# Klawisze, działajcie!

export GDK_USE_XFT=1
export QT_XFT=true
export PACMAN=/usr/bin/pacman

for i in "$HOME/.zsh/"*; do	[ -f "$i" ] && source "$i"; done; unset i
source "$HOME/.zinitrc"

# aktualizuj czas w PS1 przy każdym uruchomieniu polecenia, tak
# żeby było wiadomo godzinę uruchomienia programu
function _reset-prompt-and-accept-line {
  zle reset-prompt
  zle .accept-line     # Note the . meaning the built-in accept-line.
}
zle -N accept-line _reset-prompt-and-accept-line


