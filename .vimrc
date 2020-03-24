set nocompatible
set nomodeline
filetype off

set encoding=utf-8
let mapleader = " "

call plug#begin('~/.vim/plugged')

" Async lint engine
Plug 'dense-analysis/ale'

" Multi lanuage syntax
Plug 'sheerun/vim-polyglot'

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

" Soft tabs
set expandtab
set smarttab

set shiftwidth=4
set tabstop=4
set softtabstop=4

" Colors
set background=light
hi CursorLine cterm=NONE ctermbg=black ctermfg=NONE

" Show brackets
set showmatch

" Highlight search
set hlsearch

" Custom macros
nnoremap <leader>rtw :%s/\s\+$//e<CR>
nmap \h :nohlsearch<CR>

" Movement remap
map j gj
map k gk
noremap <Down> gj
noremap <Up> gk

" Resuming in last edited line
autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \ exe "normal! g`\"" |
        \ endif

filetype plugin indent on
syntax enable
