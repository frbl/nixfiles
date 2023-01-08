-- Stolen from https://github.com/maxverbeek/nixconfig/blob/master/home/modules/nvim/config/lua/maxconf/neoformat.lua
vim.cmd [[
    let g:neoformat_proto_clangformat = {
    \ 'exe': 'clang-format',
    \ 'args': ['--style=google --assume-filename="%:p"'],
    \ 'no_append': 1,
    \ 'stdin': 1,
    \ }
    let g:neoformat_typescriptreact_standard = {
    \ 'exe': 'ts-standard',
    \ 'stdin': 1,
    \ 'try_node_exe': 1
    \ }
    let g:neoformat_typescript_standard = {
    \ 'exe': 'ts-standard',
    \ 'stdin': 1,
    \ 'try_node_exe': 1
    \ }
    let g:neoformat_enabled_typescript = ['standard', 'prettier']
    let g:neoformat_enabled_typescriptreact = ['standard', 'prettier']
    let g:neoformat_enabled_javascript = ['standard', 'prettier']
    let g:neoformat_enabled_javascriptreact = ['standard', 'prettier']
    let g:neoformat_enabled_ruby = ['rubocop']
    let g:neoformat_try_node_exe = 1
    let g:neoformat_enabled_proto = ['clangformat']
]]


local opt = { noremap = true, silent = false }
vim.api.nvim_set_keymap('n', '<Leader>]', '<CMD>Neoformat<cr>', opt)
vim.api.nvim_set_keymap('x', '<Leader>]', '<CMD>Neoformat!<cr>', opt)

local augroup = vim.api.nvim_create_augroup("FormatOnSave", {})

--vim.api.nvim_create_autocmd("BufWritePre", {
  --group = augroup,
  --command = 'Neoformat',
--})

local toggleAutoformat = function()
    if #vim.api.nvim_get_autocmds({ group = augroup }) > 0 then
        vim.api.nvim_clear_autocmds({ group = augroup })
        print("Disabled autoformatting")
    else
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            command = 'Neoformat',
        })
        print("Enabled autoformatting")
    end
end

vim.api.nvim_create_user_command("ToggleFormatting", toggleAutoformat, {})
vim.keymap.set('n', '<F4>', toggleAutoformat)
