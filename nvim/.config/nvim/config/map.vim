" ****************************
" *       Keybindings        *
" * Étienne (Maiste)  Marais *
" ****************************


" ******************
" * Global mapping *
" ******************

" Global keys
let mapleader="\<Space>"

" Learn vim the hard way
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Map indentation with <F7>
nnoremap <F7> :call LanguageClient#textDocument_formatting()<CR>

" Exit insert mode with 800 ms timeout
imap jk <Esc>
imap kj <Esc>

" Window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Resizing
nnoremap <M-j>  :resize +2<CR>
nnoremap <M-k>  :resize -2<CR>
nnoremap <M-h>  :vertical resize -2<CR>
nnoremap <M-l>  :vertical resize +2<CR>

" Tab to move buffer
nnoremap <TAB> :bnext<CR>
nnoremap <S-TAB> :bprevious<CR>

" Delete the current buffer
nnoremap <silent> <Leader>bd :bdelete<CR>

" End research
noremap <silent> <leader>ss :nohlsearch<Bar>:echo<CR>

" Tab like emacs, visual mode
vnoremap <tab> =

" Map escap to leave terminal mode
tnoremap <Esc> <C-\><C-n>

" ************
" * NerdTree *
" ************

" Map F9 with toogle tree
map <F9> :NERDTreeToggle<CR>

" *****************
" * CtrlP Mapping *
" *****************

" Open CtrlP
nnoremap <silent> <Leader>f :CtrlP<CR>

" Open CtrlP with most recent file
nnoremap <silent> <Leader>fr :CtrlPMRU<CR>

" Cycle between buffer
nnoremap <silent> <Leader>b :CtrlPBuffer<CR>



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
nnoremap <silent> <Leader>lt :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> <Leader>le :call LanguageClient#explainErrorAtPoint()<CR>

" ********************
" * Instant markdown *
" ********************

autocmd FileType markdown nnoremap <leader>md :InstantMarkdownPreview<CR>

