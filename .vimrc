set nocompatible 
filetype off

set encoding=utf-8


call plug#begin('~/.vim/plugged')

" Plugins

Plug 'https://github.com/scrooloose/nerdtree.git'
Plug 'rust-lang/rust.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Colors

set t_Co=16
set background=dark
colorscheme kantan

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

" Resuming in last edited line 

autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \ exe "normal! g`\"" |
        \ endif

filetype plugin on 
filetype plugin indent on
syntax on
