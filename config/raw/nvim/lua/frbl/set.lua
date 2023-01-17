
-- Enable linenumbers (relative)
vim.opt.nu = true
vim.opt.relativenumber = true

-- Auto detect file changes
vim.checktime = true
vim.opt.autoread = true

-- 
-- Window size
-- 
-- silent! set winwidth=100
-- silent! set winminwidth=20
vim.opt.winwidth = 100
vim.opt.winminwidth = 20

--
-- Indentation
--
-- Size of a hard tabstop
vim.opt.tabstop = 2
-- a combination of spaces and tabs are used to simulate tab stops at a width
vim.opt.softtabstop = 2
-- Size of an indent
vim.opt.shiftwidth = 2
-- Expand a tab to spaces
vim.opt.expandtab = true
-- idk?
vim.opt.smartindent = true
-- Round the tabs so its always two
vim.opt.shiftround = true

-- Don't wrap a line in the middle of a word
vim.opt.linebreak = tue

-- Disable line wrap
vim.opt.wrap = false

-- Disable the weird tildes on the side
vim.opt.fillchars = { eob = " " }

--
-- Backup stuff- disable backups, enable long running undofile
--
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- 
-- Search
--
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
-- Case insensitive search, unless you use capitals
vim.opt.smartcase = true

-- 
-- Colors
--
vim.opt.termguicolors = true

-- There are never less than 8 lines below the current line when scrolling down.
vim.opt.scrolloff = 8
-- Show a column on the side for signs
vim.opt.signcolumn = "yes"
-- IDK?
vim.opt.isfname:append("@-@")

-- Fast update time
vim.opt.updatetime = 50


