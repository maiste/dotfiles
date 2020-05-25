" ****************************
" *    Language Vim Config   *
" * Étienne (Maiste)  Marais *
" ****************************



" *********
" * OCaml *
" *********

" ** Opam Default

" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if count(s:opam_available_tools, tool) > 0
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line



" **********
" * C Lang *
" **********

" Accept .c as C file and note cpp 
autocmd BufNewFile, BufRead *.c set filetype=c
autocmd Filetype c set tabstop=4
autocmd Filetype c set shiftwidth=4



" **************
" * Global LSP *
" **************

" Print Error Message in status and not window
let g:LanguageClient_useVirtualText = "No"

" Display types in a floating window
let g:LanguageClient_hoverPreview = "Always"

" LSP Serveur configuration
let g:LanguageClient_serverCommands = {
      \ 'rust':  ['rustup', 'run', 'stable', 'rls'],
      \ 'python': ['pyls'],
      \ 'ocaml': [&shell, &shellcmdflag, 'opam config exec -- ocaml-language-server --stdio'],
      \ 'c' : ['clangd', '-background-index'],
      \ 'cpp' : ['clangd', '-background-index'],
      \ 'go': ['gopls'],
      \ 'Dockerfile': ['docker-langserver', '--stdio'],
      \ 'javascript': ['javascript-typescript-stdio'],
      \ 'typescript': ['javascript-typescript-stdio'],
      \ }
