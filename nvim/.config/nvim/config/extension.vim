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



" *********
" * NCM2  *
" *********

" Enable buffer
autocmd BufEnter * call ncm2#enable_for_buffer()

" Display one menu
set completeopt=noinsert,menuone,noselect

" Short messages
set shortmess+=c

" Autotrigger on text changes
au TextChangedI * call ncm2#auto_trigger()

" Setup NCM2 keybindings
inoremap <c-c> <ESC>
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')



" ********************
" * Language Server  *
" ********************

" Declare new servers
let g:LanguageClient_serverCommands = {
    \ 'ocaml': [&shell, &shellcmdflag, 'opam config exec -- ocamllsp'],
    \ 'rust': ['rls'],
    \ 'python': ['pyls'],
    \ 'Dockerfile': ['docker-langserver', '--stdio'],
    \ }

" Keybindings
nnoremap <leader>ld :call LanguageClient#textDocument_definition()<CR>
nnoremap <leader>lr :call LanguageClient#textDocument_rename()<CR>
nnoremap <leader>lf :call LanguageClient#textDocument_formatting()<CR>
nnoremap <leader>lt :call LanguageClient#textDocument_typeDefinition()<CR>
nnoremap <leader>lx :call LanguageClient#textDocument_references()<CR>
nnoremap <leader>la :call LanguageClient_workspace_applyEdit()<CR>
nnoremap <leader>lc :call LanguageClient#textDocument_completion()<CR>
nnoremap <leader>lh :call LanguageClient#textDocument_hover()<CR>
nnoremap <leader>ls :call LanguageClient_textDocument_documentSymbol()<CR>
nnoremap <leader>lm :call LanguageClient_contextMenu()<CR>
