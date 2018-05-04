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

"------- vim-plug settings --------
" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug '/usr/local/opt/fzf'
Plug 'easymotion/vim-easymotion'
Plug 'fatih/vim-go'
Plug 'isRuslan/vim-es6'
Plug 'junegunn/fzf.vim'
Plug 'leafgarland/typescript-vim'
Plug 'mileszs/ack.vim'
Plug 'pangloss/vim-javascript'
Plug 'prettier/vim-prettier'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/neco-syntax'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'Valloric/YouCompleteMe'
Plug 'zchee/deoplete-go', { 'do': 'make' }
call plug#end()
filetype plugin on
"------- End vim-plug settings ---

"------- fzf settings -------
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

command! ProjectFiles execute 'Files' s:find_git_root()

nnoremap <C-p> :ProjectFiles<CR>
nnoremap <Leader>b :Buffer<CR>
"------- End fzf settings ---

"------- deoplete settings -------
let g:deoplete#enable_at_startup = 1

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"------- End deoplete settings ---

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

"------- ack.vim settings -------
let g:ackprg = 'ag --vimgrep --smart-case'
cnoreabbrev ag Ack
cnoreabbrev Ag Ack
"------- End ack.vim settings ---

"------- Javascript settings -------
let g:javascript_plugin_flow = 1

let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md Prettier
"------- End Javascript settings -------

"------- UltiSnips settings -------
let g:UltiSnipsExpandTrigger="<c-f>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"------- End UltiSnips settings ---

"------- YouCompleteMe settings -------
" Use YouCompleteMe only as GoTo tool.
" For autocomplete I like deoplete.
let g:ycm_auto_trigger = 0

nnoremap <leader>d :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>i :YcmCompleter GetType<CR>
"------- End YouCompleteMe settings ---

set secure " Disable unsafe commands in project-specific .vimrc files.

