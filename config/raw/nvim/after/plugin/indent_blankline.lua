--vim.opt.list = true

-- The indicator lines
vim.api.nvim_set_hl(0, 'IndentBlanklineChar', {fg="#555555"})

-- The line that indicates the context
vim.api.nvim_set_hl(0, 'IndentBlanklineContextChar', {fg="#999999"})

--require("ibl").setup {
  --indent = { 
    --char = "",
--blankline_space_char_blankline = ''
  --},

  --whitespace = {
    --remove_blankline_trail = true,
  --},
  --scope = { 
    --enabled = true,
    --show_start = false
  --}

  ----show_current_context_start = false,
  ----indent_blankline_space_char_blankline = '',
  ----char = "",
  ----context_char = "│",
--}
