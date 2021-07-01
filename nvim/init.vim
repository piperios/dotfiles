let mapleader = "\<Space>"
syntax enable

call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'ludovicchabant/vim-gutentags'
Plug 'preservim/tagbar'
call plug#end()

" Some general settings
set belloff=all
set encoding=utf-8
set timeoutlen=1000
set updatetime=300

" Appearance
color hue
set number
set ruler
set timeoutlen=10000
set ttimeoutlen=0

" Indentation settings
set ai
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

" Search options
set hlsearch
set incsearch
set smartcase
set showmatch

" Buffer options
set splitbelow
set splitright
set showtabline=0
set laststatus=2

" Airline settings
let g:airline_powerline_fonts=1
let g:airline_theme='hue'

let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#show_close_button = 0

let g:airline#extensions#bufferline#enabled=1
let g:airline#extensions#tagbar#enabled=1

" Nerdtree settings
nnoremap <C-t> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=1
let NERDMinimalUI=1
let NERDTreeDirArrows=1
let NERDTreeAutoDeleteBuffer=1

" Ctags
let g:gutentags_ctags_exclude = [".git", "build"]
nmap <F5> :TagbarToggle<CR>

" Custom binds
map H ^
map L $
nnoremap j gj
nnoremap k gk

nnoremap <Leader>b :b
nnoremap <Leader>d :bd!<CR>
nnoremap <Leader>e :e!<Space>
nnoremap <Leader>h :call ClearSearch()<CR>
nnoremap <Leader>j :bp<CR>
nnoremap <Leader>k :bn<CR>
nnoremap <Leader>n :tn<CR>
nnoremap <Leader>p :tp<CR>
nnoremap <Leader>l :ls<CR>
nnoremap <Leader>v :vs!<Space>
nnoremap <Leader><S-d> :bd
nnoremap <Leader><S-v> :vertical sb
nnoremap <Leader><C-p> :so Session.vim<CR>

" Autoexecuting functions
autocmd BufEnter * set fo-=c fo-=r fo-=o
autocmd BufWritePre * :%s/\s\+$//e
autocmd BufReadPost * if line("'\"") > 0 && line ("'\"") <= line("$")
      \ | exe "normal! g`\"" | endif

" Custom functions
function! ClearSearch()
  set nohlsearch
  let @/=""
endfunction
