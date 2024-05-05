--vim.opt.list = true

-- The indicator lines
vim.api.nvim_set_hl(0, 'IndentBlanklineChar', {fg="#555555"})

-- The line that indicates the context
vim.api.nvim_set_hl(0, 'IndentBlanklineContextChar', {fg="#999999"})


--require("ibl").setup {
  --indent = { 
     ---- dont show a character for all indentations, only the current scope
    --char = " ",
  --},

  --whitespace = {
    --remove_blankline_trail = true
  --},
  --scope = { 
    --enabled = true,
    --show_start = false,
    --char = "|",
  --},
--}

