vim.api.nvim_set_hl(0, 'CursorLine', {bg="#555555"})

vim.api.nvim_set_hl(0, 'Pmenu', {fg="#ffffff", bg="#222222"})
vim.api.nvim_set_hl(0, 'PmenuSel', {fg="#ffffff", bg="#555555"})

vim.api.nvim_set_hl(0, 'Directory', {fg="#01B0E8"})
vim.api.nvim_set_hl(0, 'Title', {fg="#ee00ee"})
vim.api.nvim_set_hl(0, "Whitespace", { link = "CursorLine" })

-- Color of the indentations with no text / before the text, and the cursor color
vim.api.nvim_set_hl(0, "IndentBlanklineSpaceChar", {cterm=nocombine, gui=nocombine, fg="#555555"})
vim.api.nvim_set_hl(0, "IndentBlanklineSpaceCharBlankline", {cterm=nocombine, gui=nocombine, fg="#555555"})

vim.api.nvim_set_hl(0, "Normal", { bg="#1D1F21" })

vim.api.nvim_set_hl(0, "SignColumn", { link = "Normal" })

-- The hover color of all the other words
vim.api.nvim_set_hl(0, "IlluminatedWordRead", { bg = "#333333" })

