set nocompatible 
filetype off

set encoding=utf-8


call plug#begin('~/.vim/plugged')

" File explorer
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Multi lanuage syntax 
Plug 'sheerun/vim-polyglot'

" Git plugin
Plug 'tpope/vim-fugitive'

" Colors
set termguicolors
set background=dark
colorscheme scotchy

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

" Nerdtree settings
map <C-n> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=1
let NERDTreeMinimalUI=1

" Resuming in last edited line 
autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \ exe "normal! g`\"" |
        \ endif

filetype plugin on 
filetype plugin indent on
syntax enable
