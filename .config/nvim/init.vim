filetype on
filetype plugin on
filetype indent on

source ~/.config/nvim/plug.vim

colorscheme aurora
set termguicolors
set background=dark

set title                  " ustawia tytuł
set clipboard+=unnamedplus " dodaje obsługę schowka systemowego

" Formatowanie linii statusowej
set statusline=%<%F%h%m%r%=\[%B\]\ %l,%c%V\ %P
set laststatus=2


" ******************** TABulacje ******************** 
" używaj spacji zamiast tabulacji ( :retab reformatuje taby 
set noexpandtab
"
" ile tab zajmuje miejsca (w spacjach)
set tabstop=4
"
" ????
set shiftwidth=4
"
" >> upewnij sie że taby (spacje) zachowują się jak taby (taby)
set shiftround
"
" ???
set smarttab


" ******************** Wcięcia ********************
"zachowuje to samo wcięci po przejściu do nowej linii
set autoindent
" ??????
set smartindent
" ??????
filetype plugin indent on

" ******************** szukanie ********************
set hlsearch " kolorowanie wyszukiwanych fraz
"set incsearch
"set ignorecase
"set smartcase

" ******************** Kodowanie ********************
set termencoding=utf-8
set fileencoding=utf-8
set encoding=utf-8


set nocompatible  "pracowanie w trybie niekompatybilnym do Vi
set nomodeline modelines=0
set ic  " wlacza ignorowanie wielkosci liter przy szukaniu
set scs  " wylacza ignorowanie wielkosci liter wyszukiwania jezeli sa we wzorcu wielkie litery
set shortmess+=r
set number " wyswietla numer linii po lewej
set showcmd "pokazuje polecenia w prawym dolnym rogu
set showmode "wyświetla tryb (wprowadzania, wizualny itd.)
set gcr=a:blinkon0
set errorbells
set visualbell " wizualna notyfikacja zamiast beep
set nowarn
set ignorecase
set smartcase
set novb
set spelllang=pl " słowniek polski
set paste "normalne wklejanie, bez przesuwania tekstu"
set wildmenu " wyświetlaj linie z menu podczas dopełniania
set showmatch "pokazuje który nawias klamrowy zamykamy
set incsearch "wyszukuję ciąg w trakcie wpisywania wzorca (literka po literce)
set ruler " wyświetlaj pozycje kursora na ostatniej linijce
set mouse=a "ustawia obsluge myszki (a)ll
set backspace=indent,eol,start "robi by backspace dzialal jak w innych programach
set tags+=~/.vim/tags
"set history=1000


" ******************** Syntax ********************

set nocompatible               " be iMproved
filetype off                   " required!

syntax on
syn on

let g:html_use_css=1 "koloruje style css w plikach html
let php_sql_query = 1 "koloruje składnie SQL w PHP
let php_htmlInStrings = 1 "koloruje składnie HTML w PHP
let python_highlight_all = 1 "cos do pythona
"  let perl_fold = 1 "Zwijanie tekstu po subach
"  let perl_fold_blocks = 1 "?? ^^
let perl_include_pod = 1

"  fixdel

" ******************** backup / undo / swap ********************
set directory=~/.cache/vim/swap//
set backupdir=~/.cache/vim/backup//
"set viminfo='1000,n$XDG_CACHE_HOME/vim/info
"set undodir=$XDG_CACHE_HOME/vim/undo//

" Enable backups and undo
"set backup
"set undofile

" ******************** reszta ********************
source ~/.config/nvim/fold_block.vim
source ~/.config/nvim/shortcuts.vim
