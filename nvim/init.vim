let mapleader = "\<Space>"
syntax enable
set nocompatible

if has('nvim')
    set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
    set inccommand=nosplit
    noremap <C-q> :confirm qall<CR>
end

if (has('termguicolors'))
  set termguicolors
endif

" =============================================================================
" # Plugin settings
" =============================================================================

lua << END
-- packer
vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)

    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.0',
      requires = {'nvim-lua/plenary.nvim'}
    }

    use {
      'nvim-telescope/telescope-fzf-native.nvim',
      run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
    }

    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    use 'nvim-treesitter/nvim-treesitter-context'

    use 'neovim/nvim-lspconfig'
    use 'nvim-lua/lsp_extensions.nvim'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'
    use 'ray-x/lsp_signature.nvim'

    use 'lukas-reineke/indent-blankline.nvim'

    use {
      'meliora-theme/neovim',
      requires = { 'rktjmp/lush.nvim' }
    }

end)

-- nvim-treesitter
require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = { enable = true, },
  ensure_installed = {
    "bash",
    "c",
    "cmake",
    "cpp",
    "cuda",
    "fish",
    "glsl",
    "go",
    "gomod",
    "hlsl",
    "lua",
    "make",
    "markdown",
    "rust",
    "sql",
    "toml",
    "vim",
    "zig",
  },
}

require('treesitter-context').setup {
  enable = true,
  max_lines = 3,
  trim_scope = 'outer',
  patterns = {
    default = {
      'function',
      'method',
      'for',
      'while',
      'if',
      'switch',
      'case',
    },
  },
}

require('meliora').setup {
  neutral = true,
  dim_inactive = false,
  styles = {
    comments = 'italic',
    conditionals = 'italic',
    loops = 'italic',
  },
  plugings = {
    cmp = true,
    indent_blankline = true,
    telescope = {
        enabled = true,
        nvchad_like = true,
    },
  }
}

-- =============================================================================
-- # LSP configuration
-- =============================================================================

local cmp          = require('cmp')
local lspconfig    = require('lspconfig')
local util         = require('lspconfig/util')
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

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

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { noremap=true, silent=true }

  buf_set_keymap('n', 'gD',       '<Cmd>lua vim.lsp.buf.declaration()<CR>',         opts)
  buf_set_keymap('n', 'gd',       '<Cmd>lua vim.lsp.buf.definition()<CR>',          opts)
  buf_set_keymap('n', 'gi',       '<Cmd>lua vim.lsp.buf.implementation()<CR>',      opts)
  buf_set_keymap('n', 'gr',       '<cmd>lua vim.lsp.buf.references()<CR>',          opts)
  buf_set_keymap('n', 'K',        '<Cmd>lua vim.lsp.buf.hover()<CR>',               opts)
  buf_set_keymap('n', '<C-k>',    '<cmd>lua vim.lsp.buf.signature_help()<CR>',      opts)
  buf_set_keymap('n', '<space>r', '<cmd>lua vim.lsp.buf.rename()<CR>',              opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>',       opts)
  buf_set_keymap('n', '[d',       '<cmd>lua vim.diagnostic.goto_prev()<CR>',        opts)
  buf_set_keymap('n', ']d',       '<cmd>lua vim.diagnostic.goto_next()<CR>',        opts)

  -- Get signatures (and _only_ signatures) when in argument lists.
  require "lsp_signature".on_attach({
    doc_lines = 0,
    handler_opts = {
      border = "none"
    },
  })
end

-- Zig server (zls)
lspconfig.zls.setup {
    on_attach = on_attach,
    capabilites = capabilities,
}

-- C/C++ server (clangd)
lspconfig.clangd.setup {
    on_attach = on_attach,
    capabilites = capabilities,
    cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--header-insertion=iwyu",
        "--malloc-trim",
    },
    filetypes = {"c", "cpp"},
}

-- Rust server (rust_analyzer)
lspconfig.rust_analyzer.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  flags = {
    debounce_text_changes = 150
  },
  settings = {
    ["rust-analyzer"]  = {
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
}

-- Go server (gopls)
lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilites,
  cmd = { "gopls", "serve" },
  filetypes = { "go", "gomod" },
  root_dir = util.root_pattern("go.mod"),
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
      codelenses = {
        tidy = true,
      },
      usePlaceholders = true,
    },
  },
}

-- LSP warning display
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = true,
    signs = true,
    update_in_insert = true,
  }
)

END

" =============================================================================
" # Editor settings
" =============================================================================

" Better completion
" menuone: Popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
set completeopt=menuone,noinsert,noselect

" Appearance
set background=dark
color meliora
set mouse=a

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

map <F1> <Nop>
map Q <Nop>
nnoremap ; :

nnoremap j gj
nnoremap k gk

nnoremap <silent> gn :bn!<CR>
nnoremap <silent> gp :bp!<CR>

nnoremap <silent> <Leader>d :bd!<CR>
nnoremap <silent> <Leader>w :w<CR>
nnoremap <silent> <Leader>q :q<CR>

vnoremap <silent> <Leader><CR> :nohl<CR>
nnoremap <silent> <Leader><CR> :nohl<CR>

nnoremap <silent> <Leader>t <CMD>Telescope find_files<CR>
nnoremap <silent> <Leader>h <CMD>Telescope live_grep<CR>
nnoremap <silent> <Leader>l <CMD>Telescope buffers<CR>

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

" On-save actions
autocmd BufWritePre * :%s/\s\+$//e
autocmd BufWritePre *.go lua vim.lsp.buf.formatting()
autocmd BufWritePre *.rs lua vim.lsp.buf.formatting()

" Highlight line yanking
au TextYankPost * silent! lua vim.highlight.on_yank {on_visual=false, timeout=200}

" Don't auto-insert comments on newline
autocmd BufEnter * set fo-=c fo-=r fo-=o

" Jump to last edited line on file open
if has("autocmd")
  au BufReadPost * if expand('%:p') !~# '\m/\.git/' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
