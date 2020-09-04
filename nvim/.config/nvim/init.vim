" ***************************
" *  Default configuration  *
" *            VIM          *
" * Étienne (Maiste) Marais *
" ***************************


" ******************
" * Plugin Manager *
" ******************

" Install packages in .config (can be use by vim and neovim)
call plug#begin('~/.config/nvim/plugged')

" ** Common
Plug 'ervandew/supertab'        " Use Tab
Plug 'Townk/vim-autoclose'      " Autoclose pairs
Plug 'godlygeek/tabular'        " Align
Plug 'scrooloose/nerdcommenter' " Comment code
Plug 'preservim/nerdtree'       " Open file
Plug 'tpope/vim-surround'       " Manafe surrounding
Plug 'unblevable/quick-scope'   " Char moving

" ** Add syntaxe
Plug 'cespare/vim-toml'         " Vim syntax for toml
Plug 'stephpy/vim-yaml'         " Vim syntax for yaml
Plug 'mattn/emmet-vim'          " Vim for web
Plug 'suan/vim-instant-markdown', {'for': 'markdown'} " Markdown preview
Plug 'sheerun/vim-polyglot'     " Language support

" ** Autocompletion and linting
Plug 'ncm2/ncm2'                                " Popup Menu
Plug 'roxma/nvim-yarp'                          " ncm2 dependency
                                                " Client LSP
Plug 'autozimu/LanguageClient-neovim', {
  \ 'branch': 'next',
  \ 'do': 'bash install.sh',
  \ }

" ** Snippets
Plug 'ncm2/ncm2-ultisnips'  " Integrate Ultisnips
Plug 'SirVer/ultisnips'     " Snippet manager
Plug 'honza/vim-snippets'   " Snippet collection

" ** Scheme
Plug 'vim-airline/vim-airline'                  " Status line
Plug 'vim-airline/vim-airline-themes'           " Status line theme
Plug 'joshdick/onedark.vim'                     " One dark

" ** Notes
Plug 'vimwiki/vimwiki'                          " Manage data with vim

" ** Git
Plug 'mhinz/vim-signify'       " Signify keys
Plug 'tpope/vim-fugitive'         " Git in statusline

" ** FZF
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'

call plug#end()


" *************************
" *  Basic configuration  *
" *************************

" ** Base vim
syntax on
filetype plugin indent on

" ** Simple setup
set nocompatible                                 " No compatible with Vi
set number                                       " Print line numbers
set nowrap                                       " Doesn't allow line wrap
set cursorline                                   " Highlight current line
set ruler                                        " Print cursor position
set showmatch                                    " Show parenthese highlight
set modelines=0                                  " Disable specific code #Security
set encoding=utf-8                               " Fix utf-8 encoding
set fileencoding=utf-8                           " Encode file with utf-8
set smartcase                                    " Search smart
set ignorecase                                   " Ignore case when searching
set list                                         " Display invisible chars
set hlsearch                                     " Highlight word

" ** Setup indentation **
set smartindent                                  " Smart indentation
set autoindent                                   " Keep indentation with new lines
set wrap                                         " Return at the end of a line
set tabstop=2                                    " Size of a tab when opening file
set shiftwidth=2                                 " Shift with 2 spaces
set showtabline=2                                " Show tab as 2 spaces
set expandtab                                    " Change tabulations in spaces
set colorcolumn=80                               " Set guidline for 80 columns
au BufWrite * %retab                             " Retab on save

" ** Buffers setup **
set hidden
set autowrite                                    " Autowrite buffer when hidden

" ** System clipboard
set clipboard=unnamedplus                            " Copy into system clipboard

" ** Easier vim **
set mouse=a                                      " Provide mouse
set cursorline                                   " Display current line
set cmdheight=2                                  " 2 lines for status
set showcmd                                      " Display cmd keys
set noshowmode                                   " Hide command mode
set laststatus=0                                 " Always keep the status line

set iskeyword+=-                                 " Treat word separeted by dash

" ** Swap files **
set backupdir=~/.config/nvim/neoswap/                    " for the backup files
set directory=~/.config/nvim/neoswap/                    " for the swap files

" ** LSP and autocomplete
if has('nvim')
  autocmd BufEnter * call ncm2#enable_for_buffer()
  set completeopt=noinsert,menuone,noselect
endif

" Better split
set splitbelow
set splitright


" ***********
" *  Theme  *
" ***********

" ** Against term color bugs **
set t_Co=256                                  " 256bits color
set background=dark                          " Define background as light
if(has("termguicolors"))                      " Set terminal colors or gui colors
  set termguicolors
end
if &term =~ '256color'                        " Fix xterm color for background
  set t_ut=
endif

" ** Theme style **
colorscheme onedark


" *****************
" *   Sources     *
" *****************

runtime! config/*.vim                         " Source extern config

