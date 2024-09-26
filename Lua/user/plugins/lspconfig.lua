-- Setup Mason to automatically install LSP servers
require('mason').setup()
require('mason-lspconfig').setup({ automatic_installation = true })

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- PHP
require('lspconfig').intelephense.setup({ capabilities = capabilities })

-- JavaScript, TypeScript, Vue
require('lspconfig').volar.setup({
  capabilities = capabilities,
  -- Enable "Take Over Mode" where Volar will provide all JS/TS LSP services
  -- This drastically improves the responsiveness of diagnostic updates on change
  filetypes = { 'javascript', 'typescript', 'vue' },
})

-- Tailwind CSS
require('lspconfig').tailwindcss.setup({ capabilities = capabilities })

-- JSON
require('lspconfig').jsonls.setup({
  capabilities = capabilities,
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
    },
  },
})

-- null-ls
require('null-ls').setup({
  sources = {
    require('null-ls').builtins.diagnostics.trail_space.with({
      disabled_filetypes = { 'NvimTree' }
    }),
    require('null-ls').builtins.diagnostics.eslint_d.with({
      condition = function(utils)
        return utils.root_has_file({ '.eslintrc.js' })
      end,
    }),
    require('null-ls').builtins.formatting.eslint_d.with({
      condition = function(utils)
        return utils.root_has_file({ '.eslintrc.js' })
      end,
    }),
    require('null-ls').builtins.formatting.prettierd,
  },
})
require('mason-null-ls').setup({ automatic_installation = true })

-- Keymaps
vim.keymap.set('n', '<Leader>d', '<cmd>lua vim.diagnostic.open_float()<CR>') -- Open diagnostics in a floating window
vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>')         -- Go to previous diagnostic
vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>')         -- Go to next diagnostic
vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')           -- Go to definition
vim.keymap.set('n', 'gi', ':Telescope lsp_implementations<CR>')              -- Go to implementations
vim.keymap.set('n', 'gr', ':Telescope lsp_references<CR>')                   -- Go to references
vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')                 -- Show hover information
vim.keymap.set('n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')       -- Rename symbol

-- Commands
vim.api.nvim_create_user_command('Format', function()
  vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
end, {})

-- Diagnostic configuration
vim.diagnostic.config({
  virtual_text = false,
  float = {
    source = true,
  }
})

-- Sign configuration
vim.fn.sign_define('DiagnosticSignError',{ text = '', texthl = 'DiagnosticSignError' })
vim.fn.sign_define('DiagnosticSignWarn', { text = '', texthl = 'DiagnosticSignWarn' })
vim.fn.sign_define('DiagnosticSignInfo', { text = '', texthl = 'DiagnosticSignInfo' })
vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })
