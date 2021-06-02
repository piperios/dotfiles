let mapleader = "\<Space>"
syntax enable

" Some general settings
set belloff=all
set encoding=utf-8
set timeoutlen=1000
set updatetime=300

" Appearance
set background=light
set laststatus=0
set number
set ruler
set timeoutlen=10000
set ttimeoutlen=0

hi Comment ctermfg=blue
hi LineNr ctermfg=yellow
hi PreProc ctermfg=magenta
hi Special ctermfg=magenta
hi Statement ctermfg=yellow
hi VertSplit ctermbg=white ctermfg=black

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
nnoremap <Leader>v :vs!<Space>
nnoremap <Leader><S-b> :bd
nnoremap <Leader><S-v> :vnew!<CR>
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
