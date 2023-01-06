local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
print(install_path)

local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
  vim.cmd [[packadd packer.nvim]]
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

  -- Git integration
  use('tpope/vim-fugitive')

  -- Status line
  use('itchyny/lightline.vim')

  -- Surround words with open and closing sign (cs<char>, i.e., cs; -> 'helloworld')
  use('tpope/vim-surround')


  -- System copy support
  use('christoomey/vim-system-copy')

  -- Snippets! Note that ultisnips is the runtime, honza are the snippets
  use('SirVer/ultisnips')
  use('honza/vim-snippets')

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
      "ryanoasis/vim-devicons"
    }
  }

  -- Indentation lines 
  use "lukas-reineke/indent-blankline.nvim"


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

      -- Snippets
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'},
    }
  }

  if is_bootstrap then
    require('packer').sync()
  end
end)

