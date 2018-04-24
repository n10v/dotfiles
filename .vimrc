set autoindent         " Enable autoindent
set backspace=2        " Make backspace work like most other apps
set colorcolumn=80     " Set up a ruler at 80 symbols
set clipboard=unnamed  " Use the OS clipboard by default (on versions compiled with `+clipboard`)
set cursorline         " Highlight current line
set encoding=utf-8     " Set default encoding to UTF-8
set expandtab          " Insert space characters whenever the tab key is pressed
set exrc               " Enable project-specific .vimrc
set ff=unix            " Unix end of file
set hlsearch           " Highlight found searches
set ignorecase         " Search case insensitive...
set smartcase          " ... but not it begins with upper case
set incsearch          " Shows the match while typing
set lazyredraw         " Wait to redraw
let mapleader = ','    " Set leader shortcut to a comma ','
set number             " Show line numbers
set nocompatible       " Enables us Vim specific features
set noswapfile         " No swp files
set relativenumber     " Show numbers relative to current line
set shiftwidth=2       " Number of spaces inserted for indentation
set softtabstop=2      " Number of columns that will be added when you hit Tab in insert mode
set showmode           " Show the current mode
set tabstop=2          " Number of columns a tab counts for
set ttyfast            " Indicate fast terminal conn for faster redraw
set ttyscroll=3        " Speedup scrolling
set visualbell         " Set bell off
set t_vb=
set wildmenu           " Enhance command-line completion

" Execute previous command in the right pane of tmux
nmap <Leader>r :!tmux send-keys -t right UP C-j <CR><CR>
nmap <Leader>f :!tmux send-keys -t bottom-right UP C-j <CR><CR>

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
Plugin 'easymotion/vim-easymotion'
Plugin 'ervandew/supertab'
Plugin 'fatih/vim-go'
Plugin 'flowtype/vim-flow'
Plugin 'leafgarland/typescript-vim'
Plugin 'isRuslan/vim-es6'
Plugin 'pangloss/vim-javascript'
Plugin 'prettier/vim-prettier'
Plugin 'SirVer/ultisnips'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
call vundle#end()
filetype plugin on
"------- End Vundle settings ---

"------- ctrlp settings -------
nnoremap <C-p> :CtrlP<CR>
nnoremap <Leader>b :CtrlPBuffer<CR>

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|node_modules\|tmp\|temp\|vendor$',
  \ 'file': '\.DS_Store$'
\ }
"------- End ctrlp settings ---

"------- supertab settings -------
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabClosePreviewOnPopupClose = 1
let g:SuperTabContextDefaultCompletionType = "<c-n>"
let g:SuperTabMappingBackward = "<s-nil>"
"------- End supertab settings ---

"------- vim-go settings -------
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:go_list_type = "quickfix"

au FileType go nmap <Leader>d <Plug>(go-def)
au FileType go nmap <Leader>i <Plug>(go-info)

au FileType go setl sw=2 sts=2 noexpandtab

" Open :GoDecls with ctrl-g
nmap <C-g> :GoDecls<CR>
"------- End vim-go settings ---

"------- vim-flow settings -------
"Use locally installed flow
let local_flow = finddir('node_modules', '.;') . '/.bin/flow'
if matchstr(local_flow, "^\/\\w") == ''
    let local_flow= getcwd() . "/" . local_flow
endif
if executable(local_flow)
  let g:flow#flowpath = local_flow
endif

let g:flow#enable = 0
"------- End vim-flow settings -------

"------- Javascript settings -------
let g:javascript_plugin_flow = 1

let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md Prettier

" set filetypes as typescript.jsx
autocmd BufNewFile,BufRead *.ts,*.tsx,*.jsx set filetype=typescript.jsx
"------- End vim-javascript settings -------

"------- UltiSnips settings -------
let g:UltiSnipsExpandTrigger="<c-f>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"------- End UltiSnips settings ---

set secure " Disable unsafe commands in project-specific .vimrc files.

