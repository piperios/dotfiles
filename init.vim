set nocompatible
filetype off
let mapleader = "\<Space>"

call plug#begin('~/.config/nvim/plugged')

" General
Plug 'justinmk/vim-sneak'
Plug 'itchyny/lightline.vim'

" Filesystem navigation
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Appearance
Plug 'machakann/vim-highlightedyank'
Plug 'andymass/vim-matchup'

" Fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf' }
Plug 'junegunn/fzf.vim'

" Completion support
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Formatter
Plug 'godlygeek/tabular'

" Language support
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
Plug 'rhysd/vim-clang-format'
Plug 'kh3phr3n/python-syntax'

call plug#end()

" =======================================================
" Appearance
" =======================================================

" Check terminal for true color support
if (has('termguicolors'))
    set termguicolors
endif

" Colorscheme options
colorscheme material

" Status bar
set laststatus=2

" Status bar options
let g:lightline = {
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'colorscheme': 'material',
    \ }

" =======================================================
" Custom binds/macros
" =======================================================

" Quick save
nmap <leader>w :w<CR>

" Disable search highlighting
nmap \h :nohlsearch<CR>
vmap \h :nohlsearch<CR>

" Open file
map <C-p> :Files<CR>

" Open buffers
nmap <leader>; :Buffers<CR>

" Move to start and end of line from home row
map H ^
map L $

" Movement remap
nnoremap j gj
nnoremap k gk

" Arrow keys are for noobs (it's better this way)
nnoremap <up> <nop>
nnoremap <down> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Nerdtree settings
map <C-e> :NERDTreeToggle<cr>
let NERDTreeQuitOnOpen=1
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
let NERDTreeAutoDeleteBuffer=1

" Tab to navigate completion menu
inoremap <silent><expr> <S-TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()

" Code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Rename symbol
nmap <leader>rn <Plug>(coc-rename)

" Trigger coc completion
inoremap <silent><expr> <C-.> coc#refresh()

" Trim trailing whitespaces
nnoremap <leader>rtw :%s/\s\+$//e<CR> 

" =======================================================
" Editor settings
" =======================================================

" General settings
filetype plugin indent on
set autoindent
set timeoutlen=300
syntax enable
set encoding=utf-8
set noshowmode
set hidden
let g:sneak#s_next=1

" Better safe than sorry
set secure

" More compact display for messages
set cmdheight=2

" Faster update time
set updatetime=300

" Soft tabs
set expandtab
set smarttab

set shiftwidth=4
set tabstop=4
set softtabstop=4

" Show brackets
set showmatch

" Highlight search
set hlsearch

" Proper search settings
set incsearch
set ignorecase
set smartcase
set gdefault

" Never used this, just hit it by accident when trying to hit Esc
map <F1> <nop>
imap <F1> <nop>

" Resuming in last edited line
autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \ exe "normal! g`\"" |
        \ endif

" =======================================================
" GUI settings
" =======================================================

set guioptions-=T " No toolbar
set vb t_vb = " NO. BEEPS.
set ttyfast " So I can scroll through code before dying of old age :)
set ruler " Line info
set number " Absolute line
set relativenumber " Also, relative numberline
set cursorline " Also also, cursror line, cause why not?
