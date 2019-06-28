" ***************************
" *  Default configuration  *
" *            VIM          *
" * Étienne (Maiste) Marais *
" ***************************


" ******************
" * Plugin Manager *
" ******************

call plug#begin('~/.vim/plugged')

" ** Common
Plug 'ervandew/supertab'        " Use Tab
Plug 'Townk/vim-autoclose'      " Autoclose pairs
Plug 'scrooloose/nerdtree'      " NerdTree
Plug 'airblade/vim-gitgutter'   " Git changes
Plug 'sheerun/vim-polyglot'     " Language support
Plug 'godlygeek/tabular'        " Align
Plug 'scrooloose/nerdcommenter' " Comment code
Plug 'ctrlpvim/ctrlp.vim'       " Fuzzy finder

" ** Autocompletion and linting
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'autozimu/LanguageClient-neovim', {
  \ 'branch': 'next',
  \ 'do': 'bash install.sh',
  \ }

" ** Snippets
Plug 'ncm2/ncm2-ultisnips'  " TODO
Plug 'SirVer/ultisnips'     " TODO


" ** Web
Plug 'mattn/emmet-vim'

" ** Scheme
Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'

call plug#end()



" *************************
" *  Basic configuration  *
" *************************

" ** Base vim
syntax on
filetype plugin indent on

" ** Simplet setup
set nocompatible                                 " No compatible with Vi
set number                                       " Print line numbers
set nowrap                                       " Doesn't allow line wrap
set ruler                                        " Print cursor position
set showmatch                                    " Show parentheses
set modelines=0                                  " Disable specific code #Security
set encoding=utf-8                               " Fix utf-8 encoding
set smartcase                                    " Seach smart
set ignorecase                                   " Ignore case when searching
set list                                         " Display invisible chars

" ** Setup indentation **
set smartindent                                  " Smart indentation
set autoindent                                   " Keep indentation with new lines
set wrap                                         " Return at the end of a line
set tabstop=2                                    " Size of a tab when opening file
set shiftwidth=2                                 " Shift with 2 spaces
set expandtab                                    " Change tabulations in spaces
set colorcolumn=80                               " Set guidline for 80 columns
au BufWrite * %retab                             " Retab on save

" ** Buffers setup **
set hidden
set autowrite                                    " Autowrite buffer when hidden

" ** Allow friends to use vim **
set mouse=a                                      " Provide mouse
set showcmd                                      " Display cmd

" ** Time out **
set timeoutlen=800

" ** Swap files **
set backupdir=~/.vim/neoswap/                    " for the backup files
set directory=~/.vim/neoswap/                    " for the swap files

" ** LSP and autocomplete
if has('nvim')
  autocmd BufEnter * call ncm2#enable_for_buffer()
  set completeopt=noinsert,menuone,noselect
endif



" ***********
" *  Theme  *
" ***********

" ** Against term color bugs **
set t_Co=256                                  " 256bits color
set background=light                           " Define background as dark
if(has("termguicolors"))                      " Set terminal colors or gui colors
  set termguicolors
end
" let base16colorspace=256                    " Define color base
if &term =~ '256color'                        " Fix xterm color for background
  set t_ut=
endif

" ** Theme style ** 
colorscheme gruvbox                           " Choose color scheme

" ** Improve search **
set hlsearch                                  " Highlight word



" *****************
" *   Sources     *
" *****************

runtime! config/*.vim


