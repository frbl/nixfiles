local utils = require('telescope.utils')
local builtin = require('telescope.builtin')

require('telescope').load_extension('fzy_native')
require('telescope').load_extension('file_browser')

local opts = { noremap = true, silent = true }

-- Function to enable the use of ctrl-p in both git and non git repos
local project_files = function()
  local _, ret, _ = utils.get_os_command_output({ 'git', 'rev-parse', '--is-inside-work-tree' }) 
  if ret == 0 then 
    builtin.git_files() 
  else 
    builtin.find_files() 
  end 
end

vim.keymap.set('n', '<C-p>', function() project_files() end, {})
vim.keymap.set('n', '<leader>\\', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ")})
end)

-- Used from https://github.com/maxverbeek/nixconfig/blob/master/home/modules/nvim/config/lua/maxconf/telescope.lua
vim.keymap.set('n', '<C-f>', '<cmd>Telescope live_grep<CR>', opts)
