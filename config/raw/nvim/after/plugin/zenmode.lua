  require("zen-mode").setup {
  -- callback where you can add custom code when the Zen window opens
  on_open = function(win)
    vim.opt.signcolumn = 'no'
    vim.opt.nu = false
    vim.opt.relativenumber = false
  end,
  -- callback where you can add custom code when the Zen window closes
  on_close = function()
    vim.opt.signcolumn = 'yes'
    vim.opt.nu = true
    vim.opt.relativenumber = true
  end,

    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
