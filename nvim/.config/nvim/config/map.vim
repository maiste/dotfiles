" ****************************
" *       Keybindings        *
" * Étienne (Maiste)  Marais *
" ****************************


" ******************
" * Global mapping *
" ******************

" Global keys
let mapleader=","

" Map indentation with <F7>
nnoremap <F7> mzgg=G`z

" Exit insert mode with 800 ms timeout
imap kk <Esc>

" End research
noremap <silent> <leader>ss :nohlsearch<Bar>:echo<CR>

" Tab like emacs
nnoremap <tab> ==

" Tab like emacs, visual mode
vnoremap <tab> =

" Map escap to leave terminal mode
tnoremap <Esc> <C-\><C-n>

" *****************
" * CtrlP Mapping *
" *****************

" Open CtrlP
nnoremap <silent> <Leader>f :CtrlP<CR>

" Open CtrlP with most recent file
nnoremap <silent> <Leader>fr :CtrlPMRU<CR>

" Cycle between buffer
nnoremap <silent> <Leader>b :CtrlPBuffer<CR>

" Next/Previous buffer
nnoremap <silent> <Leader>bn :bn<CR>
nnoremap <silent> <Leader>bp :bp<CR>

" Delete the current buffer
nnoremap <silent> <Leader>bd :bdelete<CR>


" ***********
" * Tabular *
" ***********

" Tabular =
vnoremap <silent> <Leader>t= :Tabularize /=<CR>

" Tabular on pattern
vnoremap <silent> <Leader>tp :Tabularize /


" ********
" * NCM2 *
" ********

" Allow to complete with CR without \n
imap <expr> <CR> (pumvisible() ? "\<c-y>" : "\<CR>")


" *******
" * LSP *
" *******

" Display type
nnoremap <silent> <Leader>gt :call LanguageClient#textDocument_hover()<CR>

nnoremap <silent> <Leader>ge :call LanguageClient#explainErrorAtPoint()<CR>




