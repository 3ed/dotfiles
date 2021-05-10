#----------------------------------------------------------------------
# Setup Local Libs
#----------------------------------------------------------------------
#
# Perl
#
eval "$(perl -I"$HOME/perl5/lib/perl5/" -Mlocal::lib)" &> /dev/null
PATH="$HOME/perl5/bin/:$PATH"
export LIBEV_FLAGS=4
#
# Ruby
#
test -x "/usr/bin/ruby" \
    && PATH="$(ruby -e'puts Gem.user_dir')/bin${PATH:+:${PATH}}"

#----------------------------------------------------------------------
# Exporting variables
#----------------------------------------------------------------------
#
export PATH="${PATH}:${HOME}/.bin"
export USER="$(id -un 2> /dev/null)"

export BROWSER="elinks"
export EDITOR="nvim"
export SYSTEMD_EDITOR="$EDITOR"
export FCEDIT="$EDITOR"
export VISUAL="$EDITOR"
export SUDO_EDITOR="$EDITOR"


#----------------------------------------------------------------------
# NNN file manager
#----------------------------------------------------------------------
#
export NNN_FALLBACK_OPENER=xdg-open
export NNN_DE_FILE_MANAGER=nautilus
export NNN_SCRIPT=/home/kas/Skrypty/fzyply.pl
export NNN_COPIER="$HOME/.config/nnn/copier.sh"
export NNN_TRASH=1
export NNN_USE_EDITOR=1
export NNN_OPENER_DETACH=1
#export NNN_CONTEXT_COLORS='1234'

#specify bookmarks (max 10)
export NNN_BMS='d:~/Zdalne;D:~/Skrypty'
