-- Leader
vim.keymap.set("n", "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "

-- No folding
vim.o.foldenable = false
vim.o.foldmethod = 'manual'
-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
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
vim.o.list = true
vim.o.listchars = 'tab:^ ,nbsp:¬,extends:»,precedes:«,trail:•'
-- Real colors!
vim.o.termguicolors = true
vim.o.winborder = "rounded"
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
vim.keymap.set('n',  '<leader>d',  '<CMD>bd<CR>')
vim.keymap.set('n',  '<leader>q',  '<CMD>q<CR>')
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
vim.keymap.set('n',  'gl',  '<CMD>e #<CR>',  { silent = true })
-- Files
vim.keymap.set('n',  'tf',  '<CMD>Neotree toggle<CR>',  { silent = true })

--
-- Autocommands
--
local config_augroup = vim.api.nvim_create_augroup('UserConfig', { clear = true })

-- Highlight yanked text
vim.api.nvim_create_autocmd(
  'TextYankPost',
  {
    group = config_augroup,
    callback = function() vim.hl.on_yank({ timeout = 500 }) end,
  }
)
-- Jump to last edit position on opening file
vim.api.nvim_create_autocmd(
  'BufReadPost',
  {
    group = config_augroup,
    callback = function()
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
if not vim.uv.fs_stat(lazypath) then
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
    priority = 1000,
    config = function()
      require('vague').setup({
        transparent = false,
        bold = false,
        italic = false,
      })
      vim.cmd('colorscheme vague')
    end
  },
  -- Nicer statusbar
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      sections = { lualine_c = {{ 'filename', path = 3 }} }
    },
  },
  -- File/text lookup
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function()
      require('telescope').setup({})
      require('telescope').load_extension('fzf')

      local builtin = require('telescope.builtin')

      vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = 'Telescope find files' })
      vim.keymap.set('n', '<leader>l', builtin.buffers, { desc = 'Telescope list buffers' })
      vim.keymap.set('n', '<leader>H', builtin.git_commits, { desc = 'Telescope repository commit history' })
      vim.keymap.set('n', 'g/', builtin.live_grep, { desc = 'Telescope live grep' })
      vim.keymap.set('n', 'gs', builtin.lsp_document_symbols, { desc = 'Telescope LSP document symbols' })
      vim.keymap.set('n', 'gS', builtin.lsp_workspace_symbols, { desc = 'Telescope LSP workspace symbols' })
    end
  },
  -- File explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    lazy = false,
    opts = {
      filesystem = {
        follow_current_file = { enabled = true },
        filtered_items = {
          visible = true,
          show_hidden_count = true,
          hide_dotfiles = true,
          hide_gitignored = true,
        }
      },
      window = { width = 64 }
    },
  },
  -- Version control
  {
    "kdheepak/lazygit.nvim",
    lazy = false,
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    keys = { { "<Leader>G", "<CMD>LazyGit<CR>", desc = "LazyGit" } },
    config = function()
        require("telescope").load_extension("lazygit")
    end
  },
  -- Easy surround
  {
    'kylechui/nvim-surround',
    event = 'VeryLazy',
    opts = {},
  },
  -- better %
  {
    'andymass/vim-matchup',
    init = function()
      vim.g.matchup_matchparen_offscreen = { method = 'popup' }
    end
  },
  {
    'sindrets/diffview.nvim'
  },
  -- Syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
  },
  -- LSP
  {
    'neovim/nvim-lspconfig',
    dependencies = { 'hrsh7th/cmp-nvim-lsp' },
    config = function()
      vim.lsp.config('*', { capabilities = require('cmp_nvim_lsp').default_capabilities() })

      -- C++
      vim.lsp.config('clangd', {
        cmd = {
          '/usr/bin/clangd',
          '--all-scopes-completion',
          '--background-index',
          '--clang-tidy',
          '--header-insertion=iwyu',
          '-j', '8'
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
            cargo        = { features = "all"    },
            checkOnSave  = true,
            check        = { command  = "clippy" },
            completion   = { postfix  = { enable = false }},
            imports      = { group    = { enable = true  }},
          },
        }
      })
      vim.lsp.enable('rust_analyzer')

      -- Zig
      vim.lsp.config('zls', {
        settings = {
          zls = { enable_build_on_save = true },
        }
      })
      vim.lsp.enable('zls')

      -- Global mappings.
      vim.keymap.set('n', '<Leader>e', vim.diagnostic.open_float)
      vim.keymap.set('n', 'g[', function() vim.diagnostic.jump({ count = -1, float = true }) end)
      vim.keymap.set('n', 'g]', function() vim.diagnostic.jump({ count = 1, float = true }) end)

      -- Use LspAttach autocommand to only map the following keys, after the language server attaches to the current buffer
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          local client = vim.lsp.get_client_by_id(ev.data.client_id)
          if not client then return end

          -- Buffer local mappings.
          local opts = { buffer = ev.buf }
          vim.keymap.set('n', 'gD',        vim.lsp.buf.declaration,    opts)
          vim.keymap.set('n', 'gd',        vim.lsp.buf.definition,     opts)
          vim.keymap.set('n', 'K',         vim.lsp.buf.hover,          opts)
          vim.keymap.set('n', 'gi',        vim.lsp.buf.implementation, opts)
          vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename,         opts)
          vim.keymap.set('n', 'gr',        vim.lsp.buf.references,     opts)

          -- Split buffer and go to definition on the new split
          vim.keymap.set('n', '<C-w>gd', function() vim.cmd('vsplit') vim.lsp.buf.definition() end, opts)

          -- C++ only: jump between source file and header
          if client.name == 'clangd' then
            vim.keymap.set('n', 'gh', function() vim.cmd('LspClangdSwitchSourceHeader') end, opts)
          end

          -- Rely on Treesitter for syntax highlighting instead of the LSP server
          client.server_capabilities.semanticTokensProvider = nil

          -- Resolve supporting clients at invocation time, including after detach.
          vim.keymap.set('n', 'ti', function()
            local clients = vim.lsp.get_clients({ bufnr = ev.buf, method = 'textDocument/inlayHint' })
            if #clients > 0 then
              local filter = { bufnr = ev.buf }
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled(filter), filter)
            end
          end, { buffer = ev.buf, desc = 'Toggle inlay hints' })
        end,
      })

      vim.api.nvim_create_autocmd('BufWritePre', {
        group = vim.api.nvim_create_augroup('UserLspFormat', { clear = true }),
        callback = function(ev)
          local clients = vim.lsp.get_clients({ bufnr = ev.buf, method = 'textDocument/formatting' })
          if #clients > 0 then
            vim.lsp.buf.format({ bufnr = ev.buf, async = false, timeout_ms = 3000 })
          end
        end,
      })
    end
  },
  -- LSP-based code-completion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
    },
    config = function()
      local cmp = require('cmp')
      cmp.setup({
        snippet = {
          expand = function(args)
            vim.snippet.expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>']     = cmp.mapping.scroll_docs(-4),
          ['<C-f>']     = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>']     = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Insert }),
        }),
        sources = cmp.config.sources({ { name = 'nvim_lsp' } },
        { { name = 'path' } }),
        experimental = { ghost_text = true },
      })
    end
  },
  -- Inline function signatures
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {
      doc_lines = 0,
      handler_opts = { border = 'none' },
    },
  }
})

-- Start highlighting only when a parser is available.
vim.api.nvim_create_autocmd('FileType', {
  group = config_augroup,
  callback = function(ev)
    local lang = vim.treesitter.language.get_lang(ev.match)
    if not lang then return end
    local ok, loaded = pcall(vim.treesitter.language.add, lang)
    if ok and loaded then
      vim.treesitter.start(ev.buf, lang)
    end
  end,
  desc = 'Enable Treesitter for installed parsers',
})
