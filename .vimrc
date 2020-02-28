set nocompatible
set nomodeline
filetype off

set encoding=utf-8
let mapleader = " "

call plug#begin('~/.vim/plugged')

" File browser
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Undo history vizualizer
Plug 'mbbill/undotree'

" Git plugins
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Async lint engine
Plug 'dense-analysis/ale'

" Multi lanuage syntax
Plug 'sheerun/vim-polyglot'

" Status bar
Plug 'itchyny/lightline.vim'

" Color scheme
Plug 'sainnhe/edge'

" Rust plugins
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'

" Fuzzy finding
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

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

" Undotree
map <C-u> :UndotreeToggle<CR>

" Nerdtree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=1
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1

" fzf
nmap ; :Buffers<CR>
nmap <leader>f :Files<CR>
nmap <leader>t :Tags<CR>

" Racer settings
set hidden 
let g:racer_cmd = "$HOME/.cargo/bin/racer"
let g:racer_experimental_completer = 1

" Colors
set termguicolors
set background=dark

let g:edge_style = 'proton'
let g:edge_disable_italic_comment = 1

colorscheme edge

" Lightline colors
let g:lightline = {
    \ 'colorscheme' : 'edge',
    \ }

" Show brackets
set showmatch

" Highlight search
set hlsearch

" Status line settings
set laststatus=2
set noshowmode

nnoremap <leader>rtw :%s/\s\+$//e<CR>
nmap \q :nohlsearch<CR>

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
