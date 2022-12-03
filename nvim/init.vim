let mapleader = "\<Space>"
syntax enable
set nocompatible

if has('nvim')
    set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
    set inccommand=nosplit
    noremap <C-q> :confirm qall<CR>
end

" =============================================================================
" # Plugin settings
" =============================================================================

lua << END
-- packer
vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)

    use 'nvim-lua/plenary.nvim'

    use 'nvim-telescope/telescope.nvim'
    use {
      'nvim-telescope/telescope-fzf-native.nvim',
      run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
    }

    use 'sindrets/diffview.nvim'

    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'nvim-treesitter/nvim-treesitter-context'
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
    "glsl",
    "go",
    "gomod",
    "llvm",
    "lua",
    "make",
    "markdown",
    "rust",
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

local actions = require("diffview.actions")
require("diffview").setup({
  diff_binaries = false,    -- Show diffs for binaries
  enhanced_diff_hl = false, -- See ':h diffview-config-enhanced_diff_hl'
  git_cmd = { "git" },      -- The git executable followed by default args.
  use_icons = false,        -- Requires nvim-web-devicons
  watch_index = true,       -- Update views and index buffers when the git index changes.
  signs = {
    fold_closed = "O",
    fold_open = "C",
    done = "✓",
  },
  view = {
    -- Configure the layout and behavior of different types of views.
    -- Available layouts:
    --  'diff1_plain'
    --    |'diff2_horizontal'
    --    |'diff2_vertical'
    --    |'diff3_horizontal'
    --    |'diff3_vertical'
    --    |'diff3_mixed'
    --    |'diff4_mixed'
    -- For more info, see ':h diffview-config-view.x.layout'.
    default = {
      -- Config for changed files, and staged files in diff views.
      layout = "diff2_horizontal",
    },
    merge_tool = {
      -- Config for conflicted files in diff views during a merge or rebase.
      layout = "diff3_horizontal",
      disable_diagnostics = true,   -- Temporarily disable diagnostics for conflict buffers while in the view.
    },
    file_history = {
      -- Config for changed files in file history views.
      layout = "diff2_horizontal",
    },
  },
  file_panel = {
    listing_style = "tree",             -- One of 'list' or 'tree'
    tree_options = {                    -- Only applies when listing_style is 'tree'
      flatten_dirs = true,              -- Flatten dirs that only contain one single dir
      folder_statuses = "only_folded",  -- One of 'never', 'only_folded' or 'always'.
    },
    win_config = {                      -- See ':h diffview-config-win_config'
      position = "left",
      width = 35,
      win_opts = {}
    },
  },
  file_history_panel = {
    log_options = {   -- See ':h diffview-config-log_options'
      single_file = {
        diff_merges = "combined",
      },
      multi_file = {
        diff_merges = "first-parent",
      },
    },
    win_config = {    -- See ':h diffview-config-win_config'
      position = "bottom",
      height = 16,
      win_opts = {}
    },
  },
  commit_log_panel = {
    win_config = {   -- See ':h diffview-config-win_config'
      win_opts = {},
    }
  },
})

END

" =============================================================================
" # Editor settings
" =============================================================================

" Better completion
"     * menuone:  Popup even when there's only one match
"     * noinsert: Do not insert text until a selection is made
"     * noselect: Do not select, force user to select one from the menu
set completeopt=menuone,noinsert,noselect

" Appearance
set t_Co=16
set background=dark

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
vnoremap ; :

nnoremap j gj
nnoremap k gk

nnoremap <silent> gn :bn!<CR>
nnoremap <silent> gp :bp!<CR>

nnoremap <silent> <Leader>d :bd!<CR>
nnoremap <silent> <Leader>w :w<CR>
nnoremap <silent> <Leader>q :q<CR>

vnoremap <silent> <Leader><CR> :nohl<CR>
nnoremap <silent> <Leader><CR> :nohl<CR>

nnoremap <silent> <Leader>f <CMD>Telescope find_files<CR>
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
" autocmd BufWritePre *.rs lua vim.lsp.buf.formatting()

" Highlight line yanking
au TextYankPost * silent! lua vim.highlight.on_yank {on_visual=false, timeout=200}

" Don't auto-insert comments on newline
autocmd BufEnter * set fo-=c fo-=r fo-=o

" Jump to last edited line on file open
if has("autocmd")
  au BufReadPost * if expand('%:p') !~# '\m/\.git/' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
