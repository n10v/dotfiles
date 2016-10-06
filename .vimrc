set autoindent       " Enable autoindent
set autoread         " Automatically read changed files
set backspace=2      " make backspace work like most other apps
set colorcolumn=80   " Set up a ruler at 80 symbols
set encoding=utf-8   " Set default encoding to UTF-8
set ff=unix          " Unix end of file
set hlsearch         " Highlight found searches
set ignorecase       " Search case insensitive...
set smartcase        " ... but not it begins with upper case
set incsearch        " Shows the match while typing
set lazyredraw       " Wait to redraw
set number           " Show line numbers
set relativenumber   " Show numbers relative to current line
set nocompatible     " Enables us Vim specific features
set noshowmatch      " Do not show matching brackets by flickering
set noswapfile       " No swp files
let mapleader = ','  " Set leader shortcut to a comma ','
set shiftwidth=2     " Number of spaces inserted for indentation
set softtabstop=2    " Number of columns that will be added when you hit Tab in insert mode
set tabstop=2        " Number of columns a tab counts for
set ttyfast          " Indicate fast terminal conn for faster redraw
set ttyscroll=3      " Speedup scrolling
set visualbell       " Set bell off

" Insert tab literal with Shift-Tab
inoremap <S-Tab> <C-V><Tab>

" Jump to next error with Ctrl-n and previous error with Ctrl-m. Close the "
" quickfix window with <leader>a
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <Leader>a :cclose<CR>

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

" Delete all trailing whitespaces on save
autocmd BufWritePre * :%s/\s\+$//e
set showbreak=>\ \ \

" Colorscheme
syntax enable
set t_Co=256
set guifont=Menlo:h12
set background=light
colorscheme macvim

" Enter automatically into the files directory
autocmd BufEnter * silent! lcd %:p:h

"------- Vundle settings --------
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-commentary'
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-fugitive'
Plugin 'fatih/vim-go'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
call vundle#end()
filetype plugin on
"------- End Vundle settings ---

"------- Supertab settings -------
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-n>"
let g:SuperTabMappingBackward = "<s-nil>"
"------- End Supertab settings ---

"------- Vim-Fugitive settings -------
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>ga :Gwrite<CR>
nnoremap <Leader>g. :!git add .<CR>
nnoremap <Leader>gc :Gcommit<CR>
"------- End Vim-Fugitive settings ---

"------- Vim-Go settings -------
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:go_list_type = "quickfix"

au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>e <Plug>(go-rename)
au FileType go setl sw=2 sts=2 noexpandtab

" :GoDef but opens in a vertical split
autocmd FileType go nmap <Leader>v <Plug>(go-def-vertical)
" :GoDef but opens in a horizontal split
autocmd FileType go nmap <Leader>s <Plug>(go-def-split)

" Open :GoDeclsDir with ctrl-g
nmap <C-g> :GoDeclsDir<cr>
imap <C-g> <esc>:<C-u>GoDeclsDir<cr>
"------- End Vim-Go settings ---
