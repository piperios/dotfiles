set nocompatible
let mapleader = "\<Space>"
syntax on

set hlsearch
set showmatch
set t_Co=16
hi Comment ctermfg=green

set timeoutlen=1000
set encoding=utf-8
set noshowmode
set hidden
set updatetime=300

set ai
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2

set incsearch
set ignorecase
set smartcase
set gdefault

nmap \h :nohlsearch<CR>
vmap \h :nohlsearch<CR>

map H ^
map L $

nnoremap j gj
nnoremap k gk

nnoremap <leader>rtw :%s/\s\+$//e<CR>

autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \ exe "normal! g`\"" |
        \ endif

set vb t_vb = 
set ruler 
set number 
