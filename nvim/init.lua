-- Leader
vim.keymap.set("n", "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "

-- No folding
vim.o.foldenable = false
vim.o.foldmethod = 'manual'
vim.o.foldlevelstart = 99
-- Scrolling context
vim.o.scrolloff = 2
-- Never show me line breaks if they're not there
vim.o.wrap = false
-- Always draw sign column
vim.o.signcolumn = 'yes'
-- Number lines
vim.o.number = true
vim.o.relativenumber = true
-- Keep focused buffer to the left/above
vim.o.splitright = true
vim.o.splitbelow = true
-- Track undos
vim.o.undofile = true
-- Decent wildmenu
-- In completion, when there is more than one match, list all matches, and only complete to longest common match
vim.o.wildmode = 'list:longest'
-- When opening a file with a command (like :e), don't suggest files like there:
vim.o.wildignore = '.hg,.svn,*~,*.png,*.jpg,*.gif,*.min.js,*.swp,*.o,vendor,dist,_site'
-- Tabs: No
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.autoindent = true
-- Case-insensitive search/replace
vim.o.ignorecase = true
-- Unless uppercase in search term
vim.o.smartcase = true
-- No beeps
vim.o.vb = true
-- Show more hidden characters. Also, show tabs nicer
vim.o.listchars = 'tab:^ ,nbsp:¬,extends:»,precedes:«,trail:•'
-- Real colors!
vim.o.termguicolors = true
-- More useful diffs (nvim -d) by ignoring whitespace
vim.opt.diffopt:append('iwhite')
--- ...and using a smarter algorithm
vim.opt.diffopt:append('algorithm:histogram')
vim.opt.diffopt:append('indent-heuristic')

--
-- Keybinds
--
vim.keymap.set({ 'n', 'v' },  '<C-h>',  '<CMD>nohlsearch<CR>')
-- Leader binds
vim.keymap.set('n',  '<leader>d',  '<CMD>bd!<CR>')
vim.keymap.set('n',  '<leader>q',  '<CMD>q!<CR>')
vim.keymap.set('n',  '<leader>w',  '<CMD>w<CR>')
-- Center search results
vim.keymap.set('n',  'n',   'nzz',   { silent = true })
vim.keymap.set('n',  'N',   'Nzz',   { silent = true })
vim.keymap.set('n',  '*',   '*zz',   { silent = true })
vim.keymap.set('n',  '#',   '#zz',   { silent = true })
vim.keymap.set('n',  'g*',  'g*zz',  { silent = true })
-- Better search
vim.keymap.set('n',  '?',    '?\\v')
vim.keymap.set('n',  '/',    '/\\v')
vim.keymap.set('c',  '%s/',  '%sm/')
-- Navigation
vim.keymap.set('',   'H',   '^')
vim.keymap.set('',   'L',   '$')
vim.keymap.set('n',  'j',   'gj')
vim.keymap.set('n',  'k',   'gk')
vim.keymap.set('n',  'gn',  '<CMD>bn!<CR>',  { silent = true })
vim.keymap.set('n',  'gp',  '<CMD>bp!<CR>',  { silent = true })

--
-- Autocommands
--
-- Highlight yanked text
vim.api.nvim_create_autocmd(
  'TextYankPost',
  {
    pattern = '*',
    command = 'silent! lua vim.highlight.on_yank({ timeout = 500 })'
  }
)
-- Jump to last edit position on opening file
vim.api.nvim_create_autocmd(
  'BufReadPost',
  {
    pattern = '*',
    callback = function(ev)
      if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
        -- ...except for in git commit messages
        if not vim.fn.expand('%:p'):find('.git', 1, true) then
          vim.cmd('exe "normal! g\'\\""')
        end
      end
    end
  }
)

--
-- Plugins
--
-- Install lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
-- Configure plugins
require('lazy').setup({
  -- Colorscheme
  {
    'vague2k/vague.nvim',
    lazy = false,
    config = function()
      require('vague').setup({
        transparent = false,
        bold = false,
        italic = false
      })
    end
  },
  -- Nicer statusbar
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    lazy = false, 
    config = function()
      require('lualine').setup {
        options = {
          icons_enabled = true,
          theme = 'vague'
        }
      }
    end
  },
  -- File/text lookup
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require('telescope.builtin') 
      vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = 'Telescope find files' })
      vim.keymap.set('n', '<leader>l', builtin.buffers, { desc = 'Telescope list buffers' })
      vim.keymap.set('n', 'g/', builtin.live_grep,  { desc = 'Telescope live grep' })
      vim.keymap.set('n', 'gs', builtin.lsp_dynamic_workspace_symbols,  { desc = 'Telescope LSP workspace symbols' })
    end
  },
  -- Easy surround
  {
    'kylechui/nvim-surround',
    event = 'VeryLazy',
    config = function()
      require('nvim-surround').setup()
    end
  },
  -- better %
  {
    'andymass/vim-matchup',
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = 'popup' }
    end
  },
  {
    'sindrets/diffview.nvim'
  },
  -- Syntax highlighting
  {
   "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
      local configs = require("nvim-treesitter.configs")
      configs.setup({
        ensure_installed = { "bash", "c", "cpp", "lua", "markdown", "python", "rust", "toml", "yaml", "vim", "vimdoc" },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },  
      })
    end
  },
  -- LSP
  {
    'neovim/nvim-lspconfig',
    config = function()
      -- C++
      vim.lsp.config('clangd', { 
        cmd = { 
          '/opt/homebrew/opt/llvm/bin/clangd',
          '--all-scopes-completion',
          '--background-index',
          '--clang-tidy',
          '--header-insertion=iwyu',
          '-j', '6'
        } 
      })
      vim.lsp.enable('clangd')

      -- Python
      vim.lsp.enable('ruff')
      vim.lsp.enable('ty')

      -- Rust
      vim.lsp.config('rust_analyzer', {
        settings = {
          ["rust-analyzer"] = {
            cargo       = { features = "all"    },
            checkOnSave = { enable   = true     },
            check       = { command  = "clippy" },
            imports     = { group    = { enable = false }},
            completion  = { postfix  = { enable = false }},
          },
        }
      })
      vim.lsp.enable('rust_analyzer')

      -- Global mappings.
      vim.keymap.set('n',  '<Leader>e',  vim.diagnostic.open_float)
      vim.keymap.set('n',  '[d',         vim.diagnostic.goto_prev)
      vim.keymap.set('n',  ']d',         vim.diagnostic.goto_next)

      -- Use LspAttach autocommand to only map the following keys, after the language server attaches to the current buffer
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          -- Enable completion triggered by <C-x><C-o>
          vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

          -- Buffer local mappings.
          local opts = { buffer = ev.buf }
          vim.keymap.set('n', 'gD',         vim.lsp.buf.declaration,     opts)
          vim.keymap.set('n', 'gd',         vim.lsp.buf.definition,      opts)
          vim.keymap.set('n', 'K',          vim.lsp.buf.hover,           opts)
          vim.keymap.set('n', 'gi',         vim.lsp.buf.implementation,  opts)
          vim.keymap.set('n', '<leader>r',  vim.lsp.buf.rename,          opts)
          vim.keymap.set('n', 'gr',         vim.lsp.buf.references,      opts)

          -- Split buffer and go to definition on the new split
          vim.keymap.set('n', '<C-w>gd', function() vim.cmd('vsplit') vim.lsp.buf.definition() end, opts)

          -- Rely on Tresitter for syntax highlighting instead of the LSP server
          vim.lsp.get_client_by_id(ev.data.client_id).server_capabilities.semanticTokensProvider = nil

          -- Toggle inlay hints on/off
          vim.keymap.set('n', '<Leader>=',
            function()
              if vim.lsp.get_client_by_id(ev.data.client_id).server_capabilities.inlayHintProvider then
                vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }), { bufnr = bufnr })
              end
            end
          )
        end,
      })

      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = buffer,
        callback = function() 
          vim.lsp.buf.format { async = true }
        end
      })
    end
  },
  -- LSP-based code-completion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      'neovim/nvim-lspconfig',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
    },
    config = function()
      local cmp = require('cmp')
      cmp.setup({
        snippet = {
          -- REQUIRED by nvim-cmp. Get rid of it once we can
          expand = function(args)
            vim.snippet.expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>']     = cmp.mapping.scroll_docs(-4),
          ['<C-f>']     = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>']     = cmp.mapping.abort(),
          -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ['<CR>'] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Insert }),
        }),
        sources = cmp.config.sources({ { name = 'nvim_lsp' } }, 
        { { name = 'path' } }),
        experimental = { ghost_text = true },
      })

      -- Enable completing paths in :
      cmp.setup.cmdline(':', { sources = cmp.config.sources({ { name = 'path' } }) })
    end
  },
  -- Inline function signatures
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {},
    config = function(_, opts)
      -- Get signatures (and _only_ signatures) when in argument lists.
      require "lsp_signature".setup({
        doc_lines = 0,
        handler_opts = { border = "none" }
      })
    end
  }
})

vim.cmd('colorscheme vague')

