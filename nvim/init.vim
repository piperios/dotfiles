let mapleader = "\<Space>"
syntax enable
set nocompatible

call plug#begin()

" LSP support
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'hrsh7th/cmp-nvim-lsp', {'branch': 'main'}
Plug 'hrsh7th/cmp-buffer', {'branch': 'main'}
Plug 'hrsh7th/cmp-path', {'branch': 'main'}
Plug 'hrsh7th/nvim-cmp', {'branch': 'main'}
Plug 'ray-x/lsp_signature.nvim'
Plug 'hrsh7th/cmp-vsnip', {'branch': 'main'}
Plug 'hrsh7th/vim-vsnip'

" Fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Editor enhancements
Plug 'editorconfig/editorconfig-vim'

" Visual enhancements
Plug 'itchyny/lightline.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'andymass/vim-matchup'

" Syntax enhancements
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'rhysd/vim-clang-format'
Plug 'dag/vim-fish'
Plug 'ziglang/zig.vim'

" Color
Plug 'kaicataldo/material.vim', { 'branch': 'main' }

call plug#end()

if has('nvim')
    set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
    set inccommand=nosplit
    noremap <C-q> :confirm qall<CR>
end

if (has('termguicolors'))
  set termguicolors
endif

let g:material_terminal_italics = 1
let g:material_theme_style='darker'
colorscheme material

" =============================================================================
" # Plugin settings
" =============================================================================

" Lightline
let g:lightline = {
      \ 'colorscheme': 'Tomorrow_Night',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileencoding', 'filetype' ] ],
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename'
      \ },
      \ }

function! LightlineFilename()
  return expand('%:t') !=# '' ? @% : '[No Name]'
endfunction

" nvim-treesitter
lua << END
require('nvim-treesitter.configs').setup {
    highlight = {
        enable = true,
    }
}
END

" =============================================================================
" # LSP configuration
" =============================================================================

lua << END
local cmp = require'cmp'

local lspconfig = require'lspconfig'
local root_pattern = require'lspconfig'.util.root_pattern

cmp.setup({
  snippet = {
    -- REQUIRED by nvim-cmp. get rid of it once we can
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<Tab>'] = cmp.mapping.confirm({ select = true })
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
  }, {
    { name = 'path' },
  }),
  experimental = {
    ghost_text = true,
  },
})

-- Enable completing paths in :
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  })
})

-- Setup lspconfig.
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD',       '<Cmd>lua vim.lsp.buf.declaration()<CR>',         opts)
  buf_set_keymap('n', 'gd',       '<Cmd>lua vim.lsp.buf.definition()<CR>',          opts)
  buf_set_keymap('n', 'K',        '<Cmd>lua vim.lsp.buf.hover()<CR>',               opts)
  buf_set_keymap('n', '<C-k>',    '<cmd>lua vim.lsp.buf.signature_help()<CR>',      opts)
  buf_set_keymap('n', '<space>r', '<cmd>lua vim.lsp.buf.rename()<CR>',              opts)
  buf_set_keymap('n', 'gr',       '<cmd>lua vim.lsp.buf.references()<CR>',          opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>',       opts)
  buf_set_keymap('n', '[d',       '<cmd>lua vim.diagnostic.goto_prev()<CR>',        opts)
  buf_set_keymap('n', ']d',       '<cmd>lua vim.diagnostic.goto_next()<CR>',        opts)
  buf_set_keymap("n", "<space>f", '<cmd>lua vim.lsp.buf.format {async = true}<CR>', opts)

  -- Get signatures (and _only_ signatures) when in argument lists.
  require "lsp_signature".on_attach({
    doc_lines = 0,
    handler_opts = {
      border = "none"
    },
  })
end

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

lspconfig.rust_analyzer.setup {
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  },
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
      },
      completion = {
        postfix = {
          enable = false,
        },
      },
    },
  },
  capabilities = capabilities,
}

lspconfig.zls.setup {
    on_attach = on_attach,
}


vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = true,
    signs = true,
    update_in_insert = true,
  }
)

-- Tree sitter config
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "cpp", "glsl", "go", "make", "markdown", "python", "rust", "toml", "yaml", "zig" },
  sync_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
END

" Enable type inlay hints
autocmd CursorHold,CursorHoldI *.rs *.zig:lua require'lsp_extensions'.inlay_hints{ only_current_line = true }

" Completion
" Better completion
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
set completeopt=menuone,noinsert,noselect

" =============================================================================
" # Editor settings
" =============================================================================

set encoding=utf-8
set timeoutlen=1000
set updatetime=300
set timeoutlen=10000
set ttimeoutlen=0

" Indentation settings
set ai
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set signcolumn=no

" Search options
set incsearch
set hlsearch
set smartcase
set showmatch
set gdefault

" Wrapping options
set formatoptions=tc " wrap text and comments using textwidth
set formatoptions+=r " continue comments when pressing ENTER in I mode
set formatoptions+=q " enable formatting of comments with gq
set formatoptions+=n " detect lists for formatting
set formatoptions+=b " auto-wrap in insert mode, and do not wrap old long lines

" Improve search
nnoremap ? ?\v
nnoremap / /\v
cnoremap %s/ %sm/

" Keybinds
map H ^
map L $

map <F1> <Esc>
imap <F1> <Esc>
map Q <Nop>
nnoremap ; :

nnoremap j gj
nnoremap k gk

nnoremap <silent> <Leader>d :bd!<CR>
nnoremap <silent> <Leader>j :bp!<CR>
nnoremap <silent> <Leader>k :bn!<CR>
nnoremap <silent> <Leader>w :w<CR>
nnoremap <silent> <Leader>q :q<CR>

vnoremap <silent> <Leader><CR> :nohl<CR>
nnoremap <silent> <Leader><CR> :nohl<CR>

nmap <silent> <Leader>t :Files<CR>
nmap <silent> <Leader>h :Ag<CR>

" =============================================================================
" # GUI settings
" =============================================================================
set vb t_vb=                    " No more beeps
set backspace=2                 " Backspace over newlines
set nofoldenable
set ttyfast
set lazyredraw
set splitbelow                  " Split below by default
set splitright                  " Split to the right by default
set synmaxcol=500
set laststatus=2
set relativenumber              " Relative line numbers
set number                      " Also show current absolute line
set diffopt+=iwhite             " No whitespace in vimdiff
set diffopt+=algorithm:patience
set diffopt+=indent-heuristic
set showcmd                     " Show (partial) command in status line.
set shortmess+=c                " don't give |ins-completion-menu| messages.

" =============================================================================
" # Autocommands
" =============================================================================
let g:zig_fmt_autosave = 1

" Don't auto-insert comments on newline
autocmd BufEnter * set fo-=c fo-=r fo-=o

" Trim trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Jump to last edited line on file open
if has("autocmd")
  au BufReadPost * if expand('%:p') !~# '\m/\.git/' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
