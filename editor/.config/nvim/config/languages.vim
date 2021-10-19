" ****************************
" *    Language Vim Config   *
" * Étienne (Maiste)  Marais *
" ****************************

" *********
" * OCaml *
" *********

" Find merlin in path
let g:opamshare = substitute(system('opam var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"



" **********
" * C Lang *
" **********

" Accept .c as C file and note cpp 
autocmd BufNewFile, BufRead *.c set filetype=c
autocmd Filetype c set tabstop=4
autocmd Filetype c set shiftwidth=4
