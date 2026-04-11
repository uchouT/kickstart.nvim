return {
  'mrcjkb/rustaceanvim',
  version = '^7',
  lazy = false,
  ft = { 'rust' },
  config = function()
    local extension_path = vim.fn.expand '~/.local/share/nvim/mason/packages/codelldb/extension/'
    local codelldb_path = extension_path .. 'adapter/codelldb'
    local liblldb_path = extension_path .. 'lldb/lib/liblldb.so' -- Linux 路径

    -- 配置 rustaceanvim 全局变量
    vim.g.rustaceanvim = {
      dap = {
        adapter = require('rustaceanvim.config').get_codelldb_adapter(codelldb_path, liblldb_path),
      },
    }
  end,
}
