call plug#begin('~/.vim/plugged')

"-------------------------------------------------------------------------------
" Themes
"-------------------------------------------------------------------------------
Plug 'rafalbromirski/vim-aurora' " set background=dark \n colorscheme aurora

"-------------------------------------------------------------------------------
" Airline - druga linia od dolu
"-------------------------------------------------------------------------------
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

let g:airline_theme='jellybeans'
let g:airline#extensions#tabline#enabled = 1

"-------------------------------------------------------------------------------
" Syntax
"-------------------------------------------------------------------------------
Plug 'tpope/vim-markdown', { 'for': 'markdown' }
Plug 'baskerville/vim-sxhkdrc'
Plug 'mboughaba/i3config.vim'
Plug 'tbastos/vim-lua', { 'for': 'lua' }
Plug 'chase/vim-ansible-yaml'
Plug 'StanAngeloff/php.vim', { 'for': 'php' }
Plug 'vim-python/python-syntax', { 'for': 'python' }
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'othree/html5.vim'
Plug 'mattn/emmet-vim'
Plug 'vim-perl/vim-perl', { 'branch': 'master', 'do': 'make clean carp highlight-all-pragmas moose test-more try-tiny; cp contrib/function-parameters.vim after/syntax/perl/', 'for': 'perl'  }
Plug 'vim-perl/vim-perl6', { 'branch': 'master', 'for': 'perl6' }

Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'mxw/vim-jsx', { 'for': 'javascript' }
Plug 'posva/vim-vue', { 'for': 'javascript' }
"Plug 'evanleck/vim-svelte'
Plug 'zinit-zsh/zinit-vim-syntax'

"-------------------------------------------------------------------------------
" perldoc-vim -> :Perldoc -f system
"-------------------------------------------------------------------------------
Plug 'hotchpotch/perldoc-vim', { 'for': 'perl' }

"-------------------------------------------------------------------------------
" perl-local-lib-path.vim
"-------------------------------------------------------------------------------
Plug 'yuuki/perl-local-lib-path.vim', { 'for': 'perl' }

"-------------------------------------------------------------------------------
" vim-perl-variable-highlighter
"-------------------------------------------------------------------------------
"Plug 'mannih/vim-perl-variable-highlighter', { 'for': 'perl' }

"-------------------------------------------------------------------------------
" threebytesfull/perltest
"-------------------------------------------------------------------------------
Plug 'threebytesfull/perltest', { 'for': 'perl' }

"-------------------------------------------------------------------------------
" perl omnicompletion
"-------------------------------------------------------------------------------
Plug 'c9s/perlomni.vim', { 'for': 'perl' }

"-------------------------------------------------------------------------------
" :Ack [options] {pattern} [{directories}]
"-------------------------------------------------------------------------------
Plug 'mileszs/ack.vim'

"-------------------------------------------------------------------------------
" Nerd Commenter (\c<space> | :help nerdcommenter)
"-------------------------------------------------------------------------------
Plug 'preservim/nerdcommenter'

"-------------------------------------------------------------------------------
" :EasyAlign <który><znak>  (skrót ga)
"-------------------------------------------------------------------------------
Plug 'junegunn/vim-easy-align'

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

"-------------------------------------------------------------------------------
" NerdTree
"-------------------------------------------------------------------------------
Plug 'scrooloose/nerdtree', { 'branch': 'master', 'on':  'NERDTreeToggle' }

map <F9> :NERDTreeToggle<CR>

"-------------------------------------------------------------------------------
" TagBar - `:TagbarToggle`
"-------------------------------------------------------------------------------
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }

map <F8> :TagbarToggle<CR>

"-------------------------------------------------------------------------------
" CtrlP
"-------------------------------------------------------------------------------
Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(zip|gz|bz2|xz|so)$',
  \ }

"-------------------------------------------------------------------------------
" vim-support IDE
"-------------------------------------------------------------------------------
"Plug 'WolfgangMehner/vim-support',  { 'tag': 'version-2.4' }
"Plug 'WolfgangMehner/bash-support', { 'tag': 'version-4.3' }
"Plug 'WolfgangMehner/perl-support', { 'tag': 'version-5.4' }

"-------------------------------------------------------------------------------
" ALE Linters
"-------------------------------------------------------------------------------
Plug 'dense-analysis/ale'

"-------------------------------------------------------------------------------
" Tabular -  Vim script for text filtering and alignment
"-------------------------------------------------------------------------------
" `:help Tabular`, `:Tabularize /,/l0l1` = |l=0|,| l=1|
"
Plug 'godlygeek/tabular'

"-------------------------------------------------------------------------------
" vim-surround   cs"' | ysiw' | ds'
"-------------------------------------------------------------------------------
Plug 'tpope/vim-surround', { 'branch': 'master' }

"-------------------------------------------------------------------------------
" Git
"-------------------------------------------------------------------------------
" gitgutter - show changes in file after last commit
Plug 'airblade/vim-gitgutter', { 'branch': 'master' }
" vim interface to git commands: :Git<Tab> :G<Tab>
Plug 'tpope/vim-fugitive'

"-------------------------------------------------------------------------------
" :Find - interface to command find
"-------------------------------------------------------------------------------
Plug 'samoshkin/vim-find-files'
"let g:find_files_findprg = 'find $d ! -type d $*'

"-------------------------------------------------------------------------------
" ConradIrwin/vim-bracketed-paste
"-------------------------------------------------------------------------------
Plug 'ConradIrwin/vim-bracketed-paste', { 'branch': 'master' }

"-------------------------------------------------------------------------------
" eregex.vim - ruby/perl style regex
"-------------------------------------------------------------------------------
Plug 'othree/eregex.vim'

"-------------------------------------------------------------------------------
" mattn/sonictemplate-vim - `:Template [name]`
"-------------------------------------------------------------------------------
Plug 'mattn/sonictemplate-vim'


" taglist.vim
" TODO check if command in 'on' is for this plug
"Plug 'vim-scripts/taglist.vim', { 'on': 'TListToggle' }

" vim-syntastic/syntastic - https://github.com/vim-syntastic/syntastic


let g:plug_threads = 12

call plug#end()

"------------------------------------------------------------------------------
" Configuration
"------------------------------------------------------------------------------

"" vim-perl-variable-highlighter
"highlight PerlVarHiLight ctermbg=black guifg=#ff0000 guibg=#000000 ctermfg=LightRed gui=bold


"" vim-perl6
let g:perl6_unicode_abbrevs = 1

"" tpope/vim-markdown
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'perl']

"" eregexp - `:M/`, `:%S//`
nnoremap <leader>/ :call eregex#toggle()<CR>

" To disable the script by default
"let g:eregex_default_enable = 0

" To change the search delimiter to something else than the default / and ?
"let g:eregex_forward_delim = '/'
"let g:eregex_backward_delim = '?'

" To force case sensitive like perl re. You can always change it by adding /i modifier.
let g:eregex_force_case = 1


"" i3wm
aug i3config_ft_detection
  au!
  au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
aug end



