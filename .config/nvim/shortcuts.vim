" ******************** Skróty ********************
"autocmd BufNewFile,BufRead *.pl map <F1> :Perldoc 
"autocmd BufNewFile,BufRead *.pm map <F1> :Perldoc 

" <F2> => Pokaż taby i końce linii
nnoremap <F2> :<C-U>setlocal lcs=tab::.,trail:.,eol:$ list! list? <CR>

" <ctrl+s> => wł/wył słownik
map <C-S> :set spell!<CR>

" <shift+3> =>  Skasuj zaznaczenie wyników wyszukiwania
map # :nohl<CR>

