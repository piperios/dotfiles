let mapleader = " "
syntax enable
set nocompatible

set background=dark
set mouse=a
set encoding=utf-8
set timeoutlen=1000
set ttimeoutlen=0
set updatetime=300
set ai
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set signcolumn=no
set incsearch
set hlsearch
set smartcase
set showmatch
set gdefault
set vb t_vb=
set backspace=2
set nofoldenable
set ttyfast
set lazyredraw
set splitbelow splitright
set synmaxcol=500
set laststatus=2
set relativenumber
set number
set showcmd

map H ^
map L $

map <F1> <Nop>
map Q <Nop>

nnoremap j gj
nnoremap k gk

nnoremap <silent> gn :bn!<CR>
nnoremap <silent> gp :bp!<CR>
nnoremap <silent> <Leader>d :bd!<CR>
nnoremap <silent> <Leader>w :w<CR>
nnoremap <silent> <Leader>q :q<CR>
vnoremap <silent> <Leader><CR> :nohl<CR>
nnoremap <silent> <Leader><CR> :nohl<CR>

autocmd BufEnter * set fo-=c fo-=r fo-=o

if has("autocmd")
  au BufReadPost * if expand('%:p') !~# '\m/\.git/' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
