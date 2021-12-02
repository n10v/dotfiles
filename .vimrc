set autoindent         " Enable autoindent
set backspace=2        " Make backspace work like most other apps
set clipboard=unnamed  " Use the OS clipboard by default (on versions compiled with `+clipboard`)
set encoding=utf-8     " Set default encoding to UTF-8
set expandtab          " Insert space characters whenever the tab key is pressed
set ff=unix            " Unix end of file
set guicursor=         " Disable cursor-styling
set history=500        " Store a ton of history (default is 20)
set hlsearch           " Highlight found searches
set ignorecase         " Search case insensitive...
set smartcase          " ... but not it begins with upper case
set incsearch          " Shows the match while typing
set lazyredraw         " Wait to redraw
let mapleader = ','    " Set leader shortcut to a comma ','
set mousehide          " Hide the mouse cursor while typing
set number             " Show line numbers
set nocompatible       " Enables us Vim specific features
set noswapfile         " No swp files
set relativenumber     " Show numbers relative to current line
set shiftwidth=2       " Number of spaces inserted for indentation
set softtabstop=2      " Number of columns that will be added when you hit Tab in insert mode
set showmode           " Show the current mode
set splitright         " Puts new vsplit windows to the right of the current
set splitbelow         " Puts new split windows to the bottom of the current
set tabstop=2          " Number of columns a tab counts for
set termguicolors      " True colors
set ttyfast            " Indicate fast terminal conn for faster redraw
set visualbell         " Set bell off
set t_vb=
set wildmenu           " Enhance command-line completion

" Fix common typos
cabbrev Q quit
cabbrev W write

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-n> :nohl<CR><C-n>

" Delete all trailing whitespaces on save
autocmd BufWritePre * :%s/\s\+$//e
set showbreak=>\ \ \

" Colorscheme
syntax enable
set t_Co=256

" Enter automatically into the files directory
autocmd BufEnter * silent! lcd %:p:h

" Make n/N always go in consistent directions:
noremap <silent> n /<CR>
noremap <silent> N ?<CR>

"------- vim-plug settings --------
" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
call plug#end()
filetype plugin on
"------- End vim-plug settings ---
