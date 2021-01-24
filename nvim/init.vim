let mapleader = "\<Space>"
syntax enable

" Some general settings
set encoding=utf-8
set timeoutlen=1000
set updatetime=300

" Grrrr
set belloff=all

" Appearance
colorscheme custom
set guifont=Consolas:h20

let g:neovide_refresh_rate=75
let g:neovide_cursor_length_lenght=0.05
let g:neovide_cursor_trail_lenght=0.1
let g:neovide_cursor_antialiasing=v:true

" File stats and line numbers
set ruler
set number

" Indentation settings
set ai
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

" Search options
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch

nmap \h :nohlsearch<CR>
vmap \h :nohlsearch<CR>

" Movement remaps
map H ^
map L $
nnoremap j gj
nnoremap k gk

" Buffer options
set splitbelow
set splitright

" Trim trailing whitespaces on save
autocmd BufWritePre * :%s/\s\+$//e

" Resume on last edited line
autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \ exe "normal! g`\"" |
        \ endif

" No auto insert comment plz
au FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
