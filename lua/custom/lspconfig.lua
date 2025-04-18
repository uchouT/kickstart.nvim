local lsp = require 'lspconfig'

lsp.clangd.setup {
    cmd = {
        'clangd', '--background-index', '--clang-tidy',
        '--completion-style=detailed'
    }, -- 配置 clangd 启动命令
    filetypes = {'c', 'cpp', 'objc', 'objcpp'}, -- 支持的文件类型
    root_dir = lsp.util.root_pattern('CMakeLists.txt', '.git'), -- 通过 CMakeLists.txt 或 .git 查找项目根目录
    settings = {
        clangd = {
            extraArgs = {'--header-insertion=iwyu'} -- 启用头文件插入功能
        }
    }
}

