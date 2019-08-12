" ****************************
" *       Keybindings        *
" * Étienne (Maiste)  Marais *
" ****************************


" ** Global mapping ** 

" Global keys 
let mapleader=","

" Map indentation with <F7>
nnoremap <F7> mzgg=G`z

" Open/Close NerdTree with <F10>
nmap <silent> <F10> :NERDTreeToggle<CR>

" Exit Insert mode with 500 ms timeout
imap kk <Esc>

" End research
nnoremap <silent> <leader> <Esc> :nohlsearch<Bar>:echo<CR>


" ** CtrlP Mapping **

" Open CtrlP 
nnoremap <silent> <Leader>f :CtrlP<CR>

" Open CtrlP with most recent file
nnoremap <silent> <Leader>fr :CtrlPMRU<CR>

" Cycle between buffer
nnoremap <silent> <Leader>b :CtrlPBuffer<CR>

" Next buffer
nnoremap <silent> <Leader>bn :bn<CR>

" Delete the current buffer
nnoremap <silent> <Leader>bd :bdelete<CR>


" ** Tabular **

" Tabular =
vnoremap <silent> <Leader>ct= :Tabularize /=<CR>

" Tabular #
vnoremap <silent> <Leader>ct# :Tabularize /#<CR>

" Tabular on pattern
vnoremap <silent> <Leader>ctp :Tabularize /










