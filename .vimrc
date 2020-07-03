set nocompatible
filetype off
let mapleader = "\<Space>"

" Background
set t_Co=16
hi Comment ctermfg=green

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

" Macro that trims trailing whitespaces
nnoremap <leader>rtw :%s/\s\+$//e<CR>

" General settings
filetype plugin indent on
syntax enable

set autoindent
set timeoutlen=1000
set encoding=utf-8
set noshowmode
set hidden

" Better safe than sorry
set secure

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

" Some functional settings
set vb t_vb = 
set ruler 
set number 
