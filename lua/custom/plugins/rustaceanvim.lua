return {
  'mrcjkb/rustaceanvim',
  ft = { 'rust' },
  init = function()
    vim.g.rustaceanvim = {
      server = {
        on_attach = function(_, bufnr)
          local bufmap = function(mode, lhs, rhs)
            vim.keymap.set(mode, lhs, rhs, { buffer = bufnr })
          end
          bufmap('n', 'K', vim.lsp.buf.hover)
          bufmap('n', 'gd', vim.lsp.buf.definition)
          bufmap('n', 'gr', vim.lsp.buf.references)
          bufmap('n', '<leader>rn', vim.lsp.buf.rename)
          bufmap('n', '<leader>ca', vim.lsp.buf.code_action)
        end,
      },
    }
  end,
}
