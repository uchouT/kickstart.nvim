-- nvim/after/ftplugin/rust.lua
local bufnr = vim.api.nvim_get_current_buf()

local map = function(keys, func, desc)
  vim.keymap.set('n', keys, func, { buffer = bufnr, desc = 'Rust: ' .. desc, silent = true })
end

map('K', function()
  vim.cmd.RustLsp { 'hover', 'actions' }
end, 'Hover Actions')
map('<leader>rd', function()
  vim.cmd.RustLsp 'debuggables'
end, 'Debuggables')
map('<leader>rr', function()
  vim.cmd.RustLsp 'runnables'
end, 'Runnables')
