-- nvim/after/ftplugin/rust.lua
local bufnr = vim.api.nvim_get_current_buf()

-- 2. 补全基础 LSP 快捷键 (因为 rustaceanvim 不会自动设置这些)
local map = function(keys, func, desc)
  vim.keymap.set('n', keys, func, { buffer = bufnr, desc = 'Rust: ' .. desc })
end

-- (跳转定义)
map('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
-- (查找引用)
map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
-- (跳转实现)
map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
-- <leader>D (类型定义)
map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
-- <leader>ds (文档符号)
map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
-- <leader>ws (工作区符号)
map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

-- 3. Rustaceanvim 专属功能
-- Code Action (分组菜单)
map('<leader>a', function()
  vim.cmd.RustLsp 'codeAction'
end, 'Code Action')
-- 悬浮文档 (支持操作)
map('K', function()
  vim.cmd.RustLsp { 'hover', 'actions' }
end, 'Hover Actions')
-- 调试与运行
map('<leader>rd', function()
  vim.cmd.RustLsp 'debuggables'
end, 'Debuggables')
map('<leader>rr', function()
  vim.cmd.RustLsp 'runnables'
end, 'Runnables')
