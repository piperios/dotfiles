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
call plug#end()

" Appearance
colorscheme custom

set noshowmode
set showtabline=2
set termguicolors
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

" File stats and line numbers
set cursorline
set number
set relativenumber
set ruler

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
nnoremap <Leader>d :bd!<CR>
nnoremap <Leader>e :e!<Space>
nnoremap <Leader>h :call ClearSearch()<CR>
nnoremap <Leader>j :bp<CR>
nnoremap <Leader>k :bn<CR>
nnoremap <Leader>l :ls<CR>
nnoremap <Leader>n :enew!<CR>
nnoremap <Leader>o :Explore<CR>
nnoremap <Leader>p :so<Space>
nnoremap <Leader>q :qa!<CR>
nnoremap <Leader>v :vnew!<CR>
nnoremap <Leader>w :w!<CR>

nnoremap <Leader><S-d> :bufdo bd!<CR>
nnoremap <Leader><S-o> :Vexplore!<CR>
nnoremap <Leader><S-p> :mks!<CR>

" Autoexecuting functions
autocmd BufEnter * :call DisableAutoInsertComment()
autocmd BufWritePre * :call TrimWhitespaceOnSave()
autocmd BufReadPost * :call ResumeOnLastEditedLine()

" Custom functions
function! ClearSearch()
  set nohlsearch
  let @/=""
endfunction

function! DisableAutoInsertComment()
  set fo-=c fo-=r fo-=o
endfunction

function! ResumeOnLastEditedLine()
  if line("'\"") > 0 && line ("'\"") <= line("$")
    exe "normal! g`\""
  endif
endfunction

function! TrimWhitespaceOnSave()
  :%s/\s\+$//e
endfunction

if has('win32')
  set guifont=Consolas:h18

  let g:neovide_cursor_animation_length=0.08
  let g:neovide_cursor_antialiasing=v:true
  let g:neovide_floating_blur=v:false
  let g:neovide_floating_opacity=1.0
  let g:neovide_fullscreen=v:true
  let g:neovide_refresh_rate=75
  let g:neovide_window_floating_blur=v:false
  let g:neovide_window_floating_opacity=0.0

  nnoremap <silent> <F11> :call ToggleNeovideFullscreen()<CR>

  function! ToggleNeovideFullscreen()
    if g:neovide_fullscreen == v:true
      let g:neovide_fullscreen=v:false
    else
      let g:neovide_fullscreen=v:true
    endif
  endfunction
endif
