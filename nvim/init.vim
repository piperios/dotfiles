let mapleader = "\<Space>"
syntax enable
filetype off

" Some general settings
set belloff=all
set encoding=utf-8
set timeoutlen=1000
set updatetime=300

call plug#begin()
Plug 'itchyny/lightline.vim'
Plug 'ycm-core/YouCompleteMe'
call plug#end()

" Appearance
color custom
set noshowmode
set ruler
set number
set showtabline=2
set timeoutlen=10000
set ttimeoutlen=0

let g:lightline = {
  \ 'colorscheme': 'custom',
  \ 'active': {
  \   'right': [['lineinfo'],
  \             ['percent'],
  \             ['fileformat', 'fileencoding', 'filetype', 'charvaluehex']],
  \ },
  \ 'component': {
  \   'charvaluehex': '0x%B'
  \ },
  \ 'enable': {
  \   'tabline': 0
  \ },
  \ }

let g:netrw_banner=0
let g:netrw_liststyle=3
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_enable_diagnostic_highlighting=0

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

" Movement remaps
map H ^
map L $
nnoremap j gj
nnoremap k gk

" Buffer options
set splitbelow
set splitright
set showtabline=0

" Custom binds
nnoremap <Leader>b :b
nnoremap <Leader>d :bd!<CR>
nnoremap <Leader>e :e!<Space>
nnoremap <Leader>h :call ClearSearch()<CR>
nnoremap <Leader>j :bp<CR>
nnoremap <Leader>k :bn<CR>
nnoremap <Leader>l :ls<CR>
nnoremap <Leader>n :enew!<CR>
nnoremap <Leader>o :Explore<CR>
nnoremap <Leader>p :so<Space>
nnoremap <Leader>q :close<CR>
nnoremap <Leader>v :vs!<Space>
nnoremap <Leader>w :w!<CR>

nnoremap <Leader>yy :YcmCompleter GoToDefinition<CR>
nnoremap <Leader>yd :YcmCompleter GoToDeclaration<CR>
nnoremap <Leader>yf :YcmCompleter RefactorName<Space>
nnoremap <Leader>yr :YcmRestartServer<CR>

nnoremap <Leader><S-b> :bd
nnoremap <Leader><S-d> :bufdo bd!<CR>
nnoremap <Leader><S-o> :Vexplore!<CR>
nnoremap <Leader><S-p> :mks!<CR>
nnoremap <Leader><S-v> :vnew!<CR>
nnoremap <Leader><S-q> :qa!<CR>
nnoremap <Leader><S-w> :w<Space>

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
