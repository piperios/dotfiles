-- Leader
vim.keymap.set("n", "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "

-- No folding
vim.o.foldenable = false
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
-- When opening a file with a command (like :e), don't suggest files like these:
vim.o.wildignore = '.hg,.svn,*~,*.png,*.jpg,*.gif,*.min.js,*.swp,*.o,vendor,dist,_site'
-- Tabs: No
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.tabstop = 4
vim.o.expandtab = true
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
-- Preselect the first completion item without inserting it
vim.o.completeopt = 'menu,menuone,noinsert,popup'
-- More useful diffs (nvim -d) by ignoring whitespace
vim.opt.diffopt:append('iwhite')
--- ...and using a smarter algorithm
vim.opt.diffopt:append('algorithm:histogram')

--
-- Keybinds
--
vim.keymap.set({ 'n', 'v' },  '<C-h>',  '<CMD>nohlsearch<CR>')
-- Leader binds
vim.keymap.set('n',  '<leader>d',  '<CMD>Bdelete<CR>')
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
vim.keymap.set('n',  'gl',  '<CMD>e #<CR>',  { silent = true })
-- Files
vim.keymap.set('n',  'tf',  '<CMD>Neotree toggle<CR>',  { silent = true })
vim.keymap.set('n',  'tF',  '<CMD>Neotree focus<CR>',   { silent = true })
-- Completion
vim.keymap.set('i',  '<C-Space>',  vim.lsp.completion.get,  { desc = 'Trigger LSP completion' })
vim.keymap.set('i',  '<CR>',  function()
  return vim.fn.complete_info({ 'selected' }).selected >= 0 and '<C-y>' or '<CR>'
end, { expr = true, desc = 'Accept the selected completion item' })

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
    callback = function(ev)
      -- ...except for in git commit messages
      if vim.tbl_contains({ 'gitcommit', 'gitrebase' }, vim.filetype.match({ buf = ev.buf })) then return end
      if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
        vim.cmd('exe "normal! g\'\\""')
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
    dir = vim.fn.stdpath('config') .. '/themes/vague',
    name = 'vague',
    lazy = false,
    priority = 1000,
    config = function()
      require('vague').setup({
        on_highlights = function(highlights, colors)
          local separator = { fg = colors.comment, bg = colors.bg }
          highlights.WinSeparator = separator
          highlights.VertSplit = separator
          highlights.NeoTreeWinSeparator = separator
          highlights.NeoTreeVertSplit = separator
        end,
      })
      vim.cmd.colorscheme('vague')
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
      event_handlers = {
        {
          event = "neo_tree_buffer_enter",
          handler = function()
            vim.opt_local.number = true
            vim.opt_local.relativenumber = true
          end,
        },
      },
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
  -- Nice tab render
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    lazy = false,
    opts = function()
      local style_preset = require("bufferline").style_preset
      return {
        options = {
          mode = "buffers",
          style_preset = { style_preset.no_bold, style_preset.no_italic },
          themable = false,   -- otherwise tabs keep their old colors when 'background' changes
          separator_style = { "", "" },
          indicator = { style = "icon", icon = "▎" },
          show_buffer_close_icons = false,
          show_close_icon = false,
          always_show_bufferline = true,
          persist_buffer_sort = true,   -- keep manual ordering
          offsets = {
            {
              filetype = "neo-tree",
              text = "File Explorer",
              text_align = "left",
              highlight = "Directory",
            }
          },
        },
        highlights = function(defaults)
          local palette = require("vague").get_palette()
          for name, highlight in pairs(defaults.highlights) do
            highlight.bg = vim.endswith(name, "_selected") and palette.line or palette.bg
          end
          defaults.highlights.indicator_selected.fg = palette.keyword
          return defaults.highlights
        end,
      }
    end,
    keys = {
      { "gn",         "<cmd>BufferLineCycleNext<cr>" },
      { "gp",         "<cmd>BufferLineCyclePrev<cr>" },
      { "g<S-n>",     "<cmd>BufferLineMoveNext<cr>"  },
      { "g<S-p>",     "<cmd>BufferLineMovePrev<cr>"  },
      { "<leader>bp", "<cmd>BufferLinePick<cr>"      },
      { "<leader>bc", "<cmd>BufferLinePickClose<cr>" },
    },
  },
  -- Delete buffers without closing their windows
  {
    'famiu/bufdelete.nvim',
    cmd = 'Bdelete',
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
    config = function()
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

      -- Global mappings.
      vim.keymap.set('n', 'g[', function() vim.diagnostic.jump({ count = -1, float = true }) end)
      vim.keymap.set('n', 'g]', function() vim.diagnostic.jump({ count = 1, float = true }) end)

      local function lsp_picker(name)
        return function() require('telescope.builtin')[name]() end
      end

      local identifier_chars = vim.split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_', '')

      -- Use LspAttach autocommand to only map the following keys, after the language server attaches to the current buffer
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          local client = vim.lsp.get_client_by_id(ev.data.client_id)
          if not client then return end

          -- Buffer local mappings.
          local opts = { buffer = ev.buf }
          vim.keymap.set('n', 'gD',        vim.lsp.buf.declaration,    opts)
          vim.keymap.set('n', 'K',         vim.lsp.buf.hover,          opts)

          vim.keymap.set('n', 'gd',  lsp_picker('lsp_definitions'),     opts)
          vim.keymap.set('n', 'gri', lsp_picker('lsp_implementations'), opts)
          vim.keymap.set('n', 'grr', lsp_picker('lsp_references'),      opts)

          -- Split buffer and go to definition on the new split
          vim.keymap.set('n', '<C-w>gd', function() vim.cmd('vsplit') vim.lsp.buf.definition() end, opts)

          -- C++ only: jump between source file and header
          if client.name == 'clangd' then
            vim.keymap.set('n', 'gh', function() vim.cmd('LspClangdSwitchSourceHeader') end, opts)
          end

          -- Rely on Treesitter for syntax highlighting instead of the LSP server
          client.server_capabilities.semanticTokensProvider = nil

          -- Complete on every identifier character, not only the server's trigger characters
          if client:supports_method('textDocument/completion') then
            local provider = client.server_capabilities.completionProvider
            local triggers = vim.list_extend(provider.triggerCharacters or {}, identifier_chars)
            provider.triggerCharacters = vim.fn.uniq(vim.fn.sort(triggers))
            vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
          end

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
            -- One formatter per buffer so servers can't reformat each other's output
            table.sort(clients, function(a, b) return a.name < b.name end)
            vim.lsp.buf.format({ bufnr = ev.buf, id = clients[1].id, async = false, timeout_ms = 3000 })
          end
        end,
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
