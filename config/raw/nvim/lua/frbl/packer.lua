local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
  --vim.cmd [[packadd packer.nvim]]
end

--vim.opt.runtimepath:prepend(install_path)

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use('wbthomason/packer.nvim')

  -- Fuzzy finding
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'nvim-telescope/telescope-fzy-native.nvim',
      'nvim-telescope/telescope-file-browser.nvim'
    } }
  }

  -- Syntax highlighting
  use (
    'nvim-treesitter/nvim-treesitter',
    {
      run = ':TSUpdate'
    }
  )

  -- Show matches on hover
  use (
    'RRethy/vim-illuminate'
  )

  -- Color schemes
  use ({
    'vim-scripts/twilight256.vim',
    config = function ()
      vim.cmd('colorscheme twilight256')
    end
  })

  -- Fancy undo functionality
  use('mbbill/undotree')

  -- Better commenting
  use('scrooloose/nerdcommenter')

  -- Help with commenting functions
  use {
    'kkoomen/vim-doge',
    run = ':call doge#install()'
  }

  -- Git integration
  use('tpope/vim-fugitive')

  -- Status line
  --use('itchyny/lightline.vim')
  use('nvim-lualine/lualine.nvim')

  -- Surround words with open and closing sign (cs<char>, i.e., cs; -> 'helloworld')
  use('tpope/vim-surround')


  -- System copy support
  use('christoomey/vim-system-copy')


  -- Formatting
  use('sbdchd/neoformat')

  -- Editorconfig support
  use('editorconfig/editorconfig-vim')

  -- Eaxy aligning tables etc
  use('junegunn/vim-easy-align')

  -- Seamless tmux and vim navigation
  use('christoomey/vim-tmux-navigator')

  -- File navigation
  use{
    'scrooloose/nerdtree',
    requires = {
      "ryanoasis/vim-devicons",
    }
  }

  -- Focus mode
  use {
    "folke/zen-mode.nvim",
  }

  -- Indentation lines
  use {
    "lukas-reineke/indent-blankline.nvim",
    requires = {
      'nvim-treesitter/nvim-treesitter',
    }
  }


  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    }
  }

  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},

      -- Snippets! Note that ultisnips is the runtime, honza are the snippets,
      { "quangnguyen30192/cmp-nvim-ultisnips"},
      { 'SirVer/ultisnips' },
      { 'honza/vim-snippets' }
    }
  }

  if is_bootstrap then
    require('packer').sync()
  end
end)

