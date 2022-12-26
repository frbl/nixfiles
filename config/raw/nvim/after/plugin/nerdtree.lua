-- NERDTREE
--
-- Open NerdTree always when no files are open
vim.NERDTreeShowFiles=1         -- Show hidden files
vim.NERDTreeQuitOnOpen=0        -- Don't quit nerdtree when opening a file
--let g:NERDTreeDirArrows=0        -- Open directories with enter
vim.splitright = true                  -- Show file drawer left
vim.g['NERDTreeChDirMode']       = 2 -- Needed for ctrlp
vim.g['NERDTreeWinSize'] = 60
-- vim.NERDTreeIgnore = "['node_modules', '\.pyc$', '\.aux$', '\.fdb_latexmk$', '\.fls$', '\.synctex.gz$', '\.docx$', '\.pdf$', '\.blg$', '\.bbl$', '\.Rd$', '\.RData$']"
vim.keymap.set("", "<C-n>", vim.cmd.NERDTreeToggle)

