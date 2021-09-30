" ****************************
" *    Language Vim Config   *
" * Étienne (Maiste)  Marais *
" ****************************

" **********
" * C Lang *
" **********

" Accept .c as C file and note cpp 
autocmd BufNewFile, BufRead *.c set filetype=c
autocmd Filetype c set tabstop=4
autocmd Filetype c set shiftwidth=4
