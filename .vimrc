set nocompatible

set encoding=utf-8
let mapleader = " "

call plug#begin('~/.vim/plugged')

" Git plugins
Plug 'tpope/vim-fugitive'

" Async lint engine
Plug 'dense-analysis/ale'

" Multi lanuage syntax
Plug 'sheerun/vim-polyglot'

" Status bar
Plug 'itchyny/lightline.vim'

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

" Appearance
set t_Co=256
set background=light
hi CursorLine cterm=NONE ctermbg=black  ctermfg=NONE

" Show brackets
set showmatch

" Highlight search
set hlsearch

" Status line settings
set laststatus=2
set noshowmode

nnoremap <leader>rtw :%s/\s\+$//e<CR>

" Resuming in last edited line
autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \ exe "normal! g`\"" |
        \ endif

filetype plugin indent on
syntax enable
