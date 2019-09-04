language en_US.utf8    " Force english language
set autoindent         " Enable autoindent
set backspace=2        " Make backspace work like most other apps
set colorcolumn=80     " Set up a ruler at 80 symbols
set clipboard=unnamed  " Use the OS clipboard by default (on versions compiled with `+clipboard`)
set cursorline         " Highlight current line
set encoding=utf-8     " Set default encoding to UTF-8
set expandtab          " Insert space characters whenever the tab key is pressed
set exrc               " Enable project-specific .vimrc
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

" Make n/N always go in consistent directions:
noremap <silent> n /<CR>
noremap <silent> N ?<CR>

"------- vim-plug settings --------
" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug '/usr/local/opt/fzf'
Plug 'fatih/vim-go'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'isRuslan/vim-es6'
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-sneak'
Plug 'krisajenkins/vim-projectlocal'
Plug 'matze/vim-move'
Plug 'pangloss/vim-javascript'
Plug 'prettier/vim-prettier'
Plug 'Shougo/echodoc.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neco-syntax'
Plug 'schickling/vim-bufonly'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'zchee/deoplete-go', { 'do': 'make' }
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

"------- deoplete settings -------
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('auto_complete_delay', 30)
call deoplete#custom#option('max_list', 50)
call deoplete#custom#option('refresh_always', v:false)
call deoplete#custom#source('_', 'max_menu_width', 160)

" Silence the  messages in the command line
" such as 'The only match', 'Pattern not found', 'Back at original", etc.
set shortmess+=c

" Don't show doc window
set completeopt-=preview

" Complete on tab
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><S-TAB> pumvisible() ? '<C-p>' : '<S-TAB>'
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

"------- Javascript settings -------
let g:javascript_plugin_flow = 1

let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md Prettier
"------- End Javascript settings -------

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

set secure " Disable unsafe commands in project-specific .vimrc files.

