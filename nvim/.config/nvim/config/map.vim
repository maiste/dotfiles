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
vnoremap <silent> <Leader>ct= :Tabularize /=<CR>

" Tabular on pattern
vnoremap <silent> <Leader>ctp :Tabularize /










