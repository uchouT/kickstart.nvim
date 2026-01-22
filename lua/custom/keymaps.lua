local key = vim.keymap
key.set('i', 'jk', '<Esc>')
key.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show line diagnostics' })
