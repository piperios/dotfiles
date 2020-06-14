set nocompatible
filetype off
let mapleader = "\<Space>"

call plug#begin('~/.config/nvim/plugged')

" General
Plug 'itchyny/lightline.vim'

" Filesystem navigation
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Appearance
Plug 'machakann/vim-highlightedyank'
Plug 'andymass/vim-matchup'

" Language support
Plug 'dense-analysis/ale'
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
Plug 'rhysd/vim-clang-format'
Plug 'kh3phr3n/python-syntax'

call plug#end()

" =======================================================
" Appearance
" =======================================================

" Background
set t_Co=16
hi Comment ctermfg=green

" Disable statusbar
set laststatus=2

" Status bar options
let g:lightline = {
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'readonly', 'filename', 'modified' ] ]
    \ }}


" =======================================================
" Custom binds/macros
" =======================================================

" Disable search highlighting
nmap \h :nohlsearch<CR>
vmap \h :nohlsearch<CR>

" Move to start and end of line from home row
map H ^
map L $

" Movement remap
nnoremap j gj
nnoremap k gk

" Unbind arrow keys
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

nnoremap <leader>gd :ALEGoToDefinition<CR>
nnoremap <leader>gr :ALEFindReferences<CR>

" Trim trailing whitespaces
nnoremap <leader>rtw :%s/\s\+$//e<CR>

" =======================================================
" Editor settings
" =======================================================

" General settings
filetype plugin indent on
set autoindent
set timeoutlen=100
set nobackup
set nowritebackup
set shortmess+=c
set completeopt-=preview
syntax enable
set encoding=utf-8
set noshowmode
set hidden

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
set vb t_vb = " NO. BEEPS. *EVER*.
set ruler " Line info
set number " Absolute line
set relativenumber " Also, relative numberline
