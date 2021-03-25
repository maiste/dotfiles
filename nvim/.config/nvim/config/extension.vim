" ****************************
" * Extension configuration  *
" *            VIM           *
" * Étienne (Maiste) Marais  *
" ****************************


" ***********
" * Airline *
" ***********

" Powerline management
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
     let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.linenr = '☰'

" Display buffer opened
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Don't check extension at startup
let g:airline#extensions#disable_rtp_load = 1

" Hide hunks count in airline
let g:airline#extensions#hunks#enabled=0



" ************
" * UltiSnip *
" ************

" Expand letter
let g:UltiSnipsExpandTrigger = "<c-e>"

" Move into snippets
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger  = "<c-k>"
let g:UltiSnipsRemoveSelectModeMappings = 0



" ***********
" * Signify *
" ***********

let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '~'



" ***********
" * Tabular *
" ***********

" Tabular =
vnoremap <silent> <Leader>t= :Tabularize /=<CR>

" Tabular on pattern
vnoremap <silent> <Leader>tp :Tabularize /



" **************
" * Quickscope *
" **************

" Trigger highlight
let g:qs_highlight_on_keys = ['f', 'F']

" Max chars
let g:qs_max_chars=150



" *******
" * Fzf *
" *******

" Open Fzf
nnoremap <silent> <Leader>ff :GFiles<CR>

" Check in files
nnoremap <silent> <Leader>fg :Rg<CR>

" Cycle between buffers
nnoremap <silent> <Leader>b :Buffers<CR>



" ***********
" * VimWiki *
" ***********

" Set default path to organizer
let g:vimwiki_list = [{ 'path': '~/.organizer','syntax': 'markdown', 'ext': '.md'}]



" ********************
" * Markdown Preview *
" ********************

" Expand tabulation as space
autocmd Filetype vimwiki set expandtab
autocmd FileType markdown nnoremap <leader>md :MarkdownPreview<CR>



" ********
" * CoC  *
" ********

" Ensure diagnostics work well
if has("patch-8.1.1564")
  set signcolumn=number
else
  set signcolumn=yes
endif

" Map <TAB> as completion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Select completion object
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Go to the next / previous diagnostic
nmap <silent> <leader>lnd <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>lpd <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> <leader>ld <Plug>(coc-definition)
nmap <silent> <leader>lt <Plug>(coc-type-definition)
nmap <silent> <leader>li <Plug>(coc-implementation)
nmap <silent> <leader>lr <Plug>(coc-references)


" Display documentation
nnoremap <silent> <leader>lh :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Rename symbol
nmap <leader>lcr <Plug>(coc-rename)

" Formatting selected code
xmap <leader>lf  <Plug>(coc-format-selected)
nmap <leader>lf  <Plug>(coc-format-selected)

" Applying codeAction to the selected region
xmap <leader>la  <Plug>(coc-codeaction-selected)
nmap <leader>la  <Plug>(coc-codeaction-selected)

" Applying codeAction to the current buffer
nmap <leader>lab  <Plug>(coc-codeaction)

" Show all diagnostics
nnoremap <silent> <leader>lcd  :<C-u>CocList diagnostics<cr>

" Show commands
nnoremap <silent> <leader>lcc  :<C-u>CocList commands<cr>

" Find symbol of current document
nnoremap <silent> <leader>lco  :<C-u>CocList outline<cr>

" Search workspace symbols
nnoremap <silent> <leader>lss  :<C-u>CocList -I symbols<cr>

" Map F9 with toogle tree
map <F9> :CocCommand explorer<CR>

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:IMP` command for organize imports of the current buffer.
command! -nargs=0 IMP  :call     CocAction('runCommand', 'editor.action.organizeImport')

" To install implementations
let g:coc_global_extensions = [
    \ 'coc-pairs',
    \ 'coc-snippets',
    \ 'coc-explorer',
    \ 'coc-marketplace',
    \ 'coc-vimlsp',
    \ 'coc-json',
    \ 'coc-metals',
    \ 'coc-flutter',
    \ 'coc-python',
    \ 'coc-java',
    \ 'coc-css',
    \ 'coc-html',
    \ 'coc-prettier',
    \ ]
