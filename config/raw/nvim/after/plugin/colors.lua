vim.api.nvim_set_hl(0, 'CursorLine', {bg="#555555"})

vim.api.nvim_set_hl(0, 'Pmenu', {fg="#ffffff", bg="#222222"})
vim.api.nvim_set_hl(0, 'PmenuSel', {fg="#ffffff", bg="#555555"})

--vim.api.nvim_set_hl(0, 'Directory', {fg="#cccccc"})
vim.api.nvim_set_hl(0, "Whitespace", { link = "CursorLine" })

-- Color of the indentations with no text / before the text, and the cursor color
vim.api.nvim_set_hl(0, "IndentBlanklineSpaceChar", {cterm=nocombine, gui=nocombine, fg="#555555"})
vim.api.nvim_set_hl(0, "IndentBlanklineSpaceCharBlankline", {cterm=nocombine, gui=nocombine, fg="#555555"})
