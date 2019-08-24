set nocompatible

set encoding=utf-8
let mapleader = " "

call plug#begin('~/.wim/plugged')

" Multi lanuage syntax
Plug 'sheerun/vim-polyglot'

" Multi colored brackets and parenthesis
Plug 'luochen1990/rainbow'

call plug#end()

" Current position
set ruler
set number
set cursorline

" No sound ffs
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Soft-tabs
set expandtab
set smarttab

set shiftwidth=4
set tabstop=4
set softtabstop=4

" Search result highlighting
set hlsearch

" Rainbow settings
let g:rainbow_active = 1
let g:rainbow_conf = {
    \ 'ctermfgs': ['blue', 'yellow', 'cyan', 'magenta']
    \ }

nnoremap <leader>rtw :%s/\s\+$//e<CR>

" Resuming in last edited line
autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \ exe "normal! g`\"" |
        \ endif

filetype plugin indent on
syntax enable
