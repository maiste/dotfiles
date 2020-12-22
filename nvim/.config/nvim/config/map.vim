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
nnoremap <F7> :CocAction('format')<CR>

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
map <F9> :CocCommand explorer<CR>

" *******
" * Fzf *
" *******

" Open Fzf
nnoremap <silent> <Leader>f :Files<CR>

" Check in files
nnoremap <silent> <Leader>fg :Rg<CR>

" Cycle between buffers
nnoremap <silent> <Leader>b :Buffers<CR>



" ***********
" * Tabular *
" ***********

" Tabular =
vnoremap <silent> <Leader>t= :Tabularize /=<CR>

" Tabular on pattern
vnoremap <silent> <Leader>tp :Tabularize /

" *******
" * CoC *
" *******

" Expand coc snippets
imap <C-e> <Plug>(coc-snippets-expand)

" Display type
nmap <silent> <Leader>lt :call <SID>show_documentation()<CR>
nmap <Leader>lf  <Plug>(coc-format-selected)
nmap <leader>lfa <plug>(coc-format)
nmap <leader>lr <plug>(coc-rename)
nmap <silent> <Leader>gd <Plug>(coc-definition)
nmap <silent> <Leader>gdd <Plug>(coc-declaration)
nmap <silent> <Leader>gt <Plug>(coc-type-definition)
nmap <silent> <Leader>gi <Plug>(coc-implementation)
nmap <silent> <Leader>gr <Plug>(coc-references)

" Use K to show documentation in preview window.
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" ********************
" * Markdown preview *
" ********************

autocmd FileType markdown nnoremap <leader>md :MarkdownPreview<CR>

