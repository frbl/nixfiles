vim.g.mapleader = ","

local opt = { noremap = true, silent = true }

-- The first argument is the mode (normal / visual / insert), then the key, and
-- then the command.
-- vim.keymap.set("n", "<C-n>", vim.cmd.Lexplore)

-- For now; don't use ;
vim.keymap.set("n", ";", ":")

-- Duplicate line on leader d
vim.keymap.set("n", "<leader>d", '"dyy"dp')
vim.keymap.set("v", "<leader>d", '"dy"dP')


-- Bind cTRL+movement to move around the windows
vim.keymap.set("n", "<c-j>", "<c-w>j")
vim.keymap.set("n", "<c-k>", '<c-w>k')
vim.keymap.set("n", "<c-l>", '<c-w>l')
vim.keymap.set("n", "<c-h>", '<c-w>h')

--
-- TMUX
--
-- Needed for tmux and vim to play nice
vim.keymap.set("", "<Esc>[A", "<Up>")
vim.keymap.set("", "<Esc>[B", "<Down>")
vim.keymap.set("", "<Esc>[C", "<Right>")
vim.keymap.set("", "<Esc>[D", "<Left>")

vim.keymap.set("c", "<Esc>[A", "<Up>")
vim.keymap.set("c", "<Esc>[B", "<Down>")
vim.keymap.set("c", "<Esc>[C", "<Right>")
vim.keymap.set("c", "<Esc>[D", "<Left>")

-- List the contents of the registers
vim.keymap.set("n", "<Leader>p", vim.cmd.registers)

-- Easier indenting code blocks
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Better navigation in wrapped lines
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
vim.keymap.set("n", "gj", "j")
vim.keymap.set("n", "gk", "k")

-- Hotkey to remove highlight
vim.keymap.set("n", "<Leader>/", vim.cmd.noh)

-- Increase / decrease size of split
-- TODO Make this work in lua
vim.keymap.set("n", "<Leader>= :exe", "vertical resize +10<CR>")
vim.keymap.set("n", "<Leader>- :exe", "vertical resize -10<CR>")

-- Speed up scrolling of the viewport slightly
vim.keymap.set("n", "<C-e>", "2<C-e>")
vim.keymap.set("n", "<C-y>", "3<C-y>")

-- Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
-- which is the default
vim.keymap.set("", "Y", "y$")

-- Map J to itself and also jump back after merging
vim.keymap.set("n", "J", "J0")

-- sudo to write
vim.keymap.set("c", "w!!", "w !sudo tee % >/dev/null")

-- Remove whitespace
--function DeleteTrailingWS()
  --vim.cmd('exe "normal mz"')
  --vim.cmd("%s/\s\+$//ge")
  --vim.cmd('exe "normal `z"')
--end
--vim.keymap.set("c", "<Leader>k", vim.cmd.call(DeleteTrailingWS))
--map <Leader>k :call DeleteTrailingWS()<cr>
--
vim.api.nvim_create_user_command('Gblame', 'Git blame', {})


-- move code around
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Quickfix bindings
-- TODO: How to move stuff to quickfix list?
-- TODO: How to navigate 0Glog
--vim.keymap.set('n', '<Leader>cq', '<CMD>cclose<cr>', opt)
--vim.keymap.set('n', 'J', '<CMD>cnext<cr>', opt)
--vim.keymap.set('n', 'K', '<CMD>cprev<cr>', opt)
