" ****************************
" * Extension configuration  *
" *            VIM           *
" * Étienne (Maiste) Marais  *
" ****************************

" *******
" * CoC *
" *******

let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
	\ 'coc-explorer',
	\ 'coc-marketplace',
  \ 'coc-json',
	\ 'coc-vimlsp',
	\ 'coc-java',
	\ 'coc-metals',
	\ 'coc-css'
  \ ]

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


" **************
" * Quickscope *
" **************

" Trigger highlight
let g:qs_highlight_on_keys = ['f', 'F']

" Max chars
let g:qs_max_chars=150

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
