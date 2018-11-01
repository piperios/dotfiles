set nocompatible 
filetype off

set encoding=utf-8


call plug#begin('~/.vim/plugged')

" Plugins

Plug 'https://github.com/scrooloose/nerdtree.git'

" Colors

set t_Co=16
set background=dark
colorscheme kantan

" Current position

set ruler
set number
set cursorline

call plug#end()

filetype plugin on 
filetype plugin indent on
syntax on
