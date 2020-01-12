set autoindent         " Enable autoindent
set backspace=2        " Make backspace work like most other apps
set colorcolumn=120    " Set up a ruler at 80 symbols
set clipboard=unnamed  " Use the OS clipboard by default (on versions compiled with `+clipboard`)
set cursorline         " Highlight current line
set encoding=utf-8     " Set default encoding to UTF-8
set expandtab          " Insert space characters whenever the tab key is pressed
set ff=unix            " Unix end of file
set guicursor=         " Disable cursor-styling
set history=1000       " Store a ton of history (default is 20)
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

" Execute previous command in the right pane of tmux
nmap <Leader>r :!tmux send-keys -t right UP C-j <CR><CR>
nmap <Leader>f :!tmux send-keys -t bottom-right UP C-j <CR><CR>

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-n> :nohl<CR><C-n>

" Delete all trailing whitespaces on save
autocmd BufWritePre * :%s/\s\+$//e
set showbreak=>\ \ \

" Colorscheme
syntax enable
set t_Co=256
set background=light

" Enter automatically into the files directory
autocmd BufEnter * silent! lcd %:p:h

" Make n/N always go in consistent directions:
noremap <silent> n /<CR>
noremap <silent> N ?<CR>

"------- vim-plug settings --------
" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-sneak'
Plug 'pangloss/vim-javascript'
Plug 'schickling/vim-bufonly'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
call plug#end()
filetype plugin on
"------- End vim-plug settings ---

function! Find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

"------- fzf settings -------
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

command! ProjectFiles execute 'Files' Find_git_root()

nnoremap <C-p> :ProjectFiles<CR>
nnoremap <Leader>b :Buffer<CR>
nnoremap <Leader>w :Windows<CR>
"------- End fzf settings ---

"------- echodoc settings -------
let g:echodoc#enable_at_startup = 1
set cmdheight=2
"------- End echodoc settings ---

"------- vim-multiple-cursors settings -------
let g:multi_cursor_use_default_mapping=0

let g:multi_cursor_start_word_key      = '<C-c>'
let g:multi_cursor_select_all_word_key = '<A-c>'
let g:multi_cursor_start_key           = 'g<C-c>'
let g:multi_cursor_select_all_key      = 'g<A-c>'
let g:multi_cursor_next_key            = '<C-c>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

" Disable Deoplete when selecting multiple cursors starts
function! Multiple_cursors_before()
    if exists('*deoplete#disable')
        execute 'call deoplete#disable()'
    endif
endfunction

" Enable Deoplete when selecting multiple cursors ends
function! Multiple_cursors_after()
    if exists('*deoplete#toggle')
        execute 'call deoplete#toggle()'
    endif
  endfunction
"------- End vim-multiple-cursors settings ---
