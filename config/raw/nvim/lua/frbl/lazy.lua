local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Fuzzy finding
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.4',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'nvim-telescope/telescope-fzy-native.nvim',
      'nvim-telescope/telescope-file-browser.nvim',
    },
  },

  -- Syntax highlighting
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = { 'BufReadPost', 'BufNewFile' },
    config = function()
      require('nvim-treesitter.config').setup({
        ensure_installed = { "nix", "go", "javascript", "typescript", "ruby", "bash", "c", "lua", "rust" },
        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = true,
        },
      })
    end,
  },

  -- Color scheme
  {
    'vim-scripts/twilight256.vim',
    config = function()
      vim.cmd('colorscheme twilight256')
    end,
  },

  -- Copilot
  'github/copilot.vim',

  -- Gemini
  --'github/gemini.nvim',

  -- Undo tree
  'mbbill/undotree',

  -- Better commenting
  'scrooloose/nerdcommenter',

  -- Documentation generation
  {
    'kkoomen/vim-doge',
    build = ':call doge#install()',
  },

  -- Git integration
  'tpope/vim-fugitive',

  -- Surround
  'tpope/vim-surround',

  -- System copy support
  'christoomey/vim-system-copy',

  -- Formatting
  'sbdchd/neoformat',

  -- EditorConfig
  'editorconfig/editorconfig-vim',

  -- Table alignment
  'junegunn/vim-easy-align',

  -- Tmux navigation
  'christoomey/vim-tmux-navigator',

  -- File navigation (NERDTree)
  {
    'scrooloose/nerdtree',
    dependencies = {
      'ryanoasis/vim-devicons',
    },
  },

  -- Focus mode
  'folke/zen-mode.nvim',

  -- Indentation guides
  {
    'lukas-reineke/indent-blankline.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
  },

  -- nvim-tree file explorer
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
  },

  -- LSP zero and completion stack
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
      'neovim/nvim-lspconfig',
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',
    },
  },
})
