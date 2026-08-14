local key = vim.keymap
key.set('i', 'jk', '<Esc>')
key.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show line diagnostics' })

key.set({ 'n', 'v' }, '<leader>y', '"+y', { desc = 'Yank to system clipboard' })
key.set({ 'n', 'v' }, '<leader>p', '"+p', { desc = 'Paste to system clipboard' })
