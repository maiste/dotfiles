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
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" Display buffer opened
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Don't check extension at startup
let g:airline#extensions#disable_rtp_load = 1

" Hide hunks count in airline
let g:airline#extensions#hunks#enabled=0



" **************
" * Git Gutter *
" **************

" Preview git in new buffer
let g:gitgutter_preview_win_floating = 0

" ************
" * UltiSnip *
" ************

" Trigger snippet
inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')

" Move into snippets
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger  = "<c-k>"
let g:UltiSnipsRemoveSelectModeMappings = 0
