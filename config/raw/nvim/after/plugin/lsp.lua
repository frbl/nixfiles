local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
  'tsserver',
  'eslint',
  'sumneko_lua',
  'solargraph',
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}

-- Remaps
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<cr>'] = cmp.mapping.confirm({select = true}),
  ['<Leader>,'] = cmp.mapping.complete(),
  ['<C-Space>'] = cmp.mapping.complete(),
})

-- Reserve space for diagnostic icons

vim.opt.signcolumn = 'yes'

-- Signs when somehting is wrong
lsp.set_preferences({
  sign_icons = {
    error = "☠️",
    warn = "⚠",
    info = "⚐",
    hint= "💡",
  }
})

-- Happens on each buffer that has an LSP that's associated with it
lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", function () vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function () vim.lsp.buf.hover() end, opts)
  vim.keymap.set("i", "<C-h>", function () vim.lsp.buf.signature_help() end, opts)
end)

-- Actually set up the LSP
lsp.setup()

