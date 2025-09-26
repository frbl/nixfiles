local lsp = require('lsp-zero')

-- lsp.preset('recommended')

-- Set update time for cursorhold autocommand
vim.o.updatetime = 300

-- Enable 'on hover' lsp feedback
vim.cmd([[
  augroup holddiagnostics
    autocmd!
    autocmd CursorHold * lua vim.diagnostic.open_float({ scope = "cursor", focusable = false })
  augroup END
]])

local lsp_zero = require('lsp-zero')

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {'gopls', 'ts_ls', 'eslint','solargraph', 'tflint'},
  handlers = {
    lsp_zero.default_setup,
    lua_ls = function()
      local lua_opts = lsp_zero.nvim_lua_ls()
      require('lspconfig').lua_ls.setup(lua_opts)
    end,
  }
})


--lsp.ensure_installed({
  --'tsserver',
  --'eslint',
  --'solargraph',
--})

local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}

-- Remaps
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<cr>'] = cmp.mapping.confirm({select = true}),
  ['<C-Space>'] = cmp.mapping.complete(),

  [",,"] = cmp.mapping(
    function(fallback)
      cmp_ultisnips_mappings.expand_or_jump_forwards(fallback)
    end,
    { "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }
  ),
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

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  mapping = cmp_mappings,
  snippet = {
    expand = function(args)
      vim.fn["UltiSnips#Anon"](args.body)
    end,
  },
  sources = {
    {name = "luasnip"},
    { name = 'nvim_lsp' },
    { name = "ultisnips" }
  }
})


-- Happens on each buffer that has an LSP that's associated with it
---@diagnostic disable-next-line: unused-local
lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  -- highlight word under cursor
  if client.server_capabilities.documentHighlightProvider then
    vim.cmd([[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]])
  end

  vim.keymap.set("n", "gd", function () vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "gu", function () vim.lsp.buf.references() end, opts)

  vim.keymap.set("n", "K", function () vim.lsp.buf.hover() end, opts)
  vim.keymap.set("i", "<C-h>", function () vim.lsp.buf.signature_help() end, opts)

  vim.keymap.set("n", "g]", function () vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "g[", function () vim.diagnostic.goto_prev() end, opts)

  vim.keymap.set('n', 'ga',         "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
end)

-- If you wish to add support for your config written in lua, 
-- add this line above lsp.setup().
--lsp.nvim_workspace()

-- Actually set up the LSP
lsp.setup()

-- Show Some colors when something is wrong
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineError', {fg="#ff0000", underline=true})
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineWarning', {fg="#ff7400", underline=true})


-- Set some diagnostic settings. Note that this should be after setup
vim.diagnostic.config({
  -- If set to true; diagnostics are shown without hovering
  virtual_text = false,
  -- Show the icons in the sidebar
  signs = true,
  update_in_insert = true,
  underline = true,
  severity_sort = false,
  -- Style of the float
  float = { border = "single" },
})
