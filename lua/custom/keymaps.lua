local key = vim.keymap
key.set('i', 'jk', '<Esc>')

-- 1 快速跳转行首 0 快速跳转行尾
key.set('n', '1', '0', { noremap = true })
key.set('n', '0', '$', { noremap = true })
