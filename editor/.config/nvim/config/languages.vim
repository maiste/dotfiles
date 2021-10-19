" ****************************
" *    Language Vim Config   *
" * Étienne (Maiste)  Marais *
" ****************************

" *********
" * OCaml *
" *********

if executable('ocamlmerlin')
" Find merlin in path
  let g:opamshare = substitute(system('opam var share'),'\n$','','''')
  execute "set rtp+=" . g:opamshare . "/merlin/vim"
  execute "helptags " . g:opamshare .  "/merlin/vim/doc"
endif

" Merlin default config
let g:merlin_split_method = "always tab"

" Specific commands
nmap <silent> <Leader>ml :MerlinLocate<CR>
nmap <silent> <Leader>mt :MerlinTypeOf<CR>
nmap <silent> <Leader>mo :MerlinOccurences<CR>
nmap <silent> <Leader>mli :MLI
nmap <silent> <Leader>mlf :ML



" **********
" * C Lang *
" **********

" Accept .c as C file and note cpp 
autocmd BufNewFile, BufRead *.c set filetype=c
autocmd Filetype c set tabstop=4
autocmd Filetype c set shiftwidth=4
