return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require('bufferline').setup {
      options = {
        -- 核心配置：告诉 bufferline 左边有个 neo-tree
        offsets = {
          {
            filetype = 'neo-tree',
            text = 'File Explorer', -- 在 neo-tree 上方显示的文字
            text_align = 'left', -- 文字对齐方式
            separator = true,
          },
        },
        -- 其他常用配置
        show_buffer_close_icons = false,
        show_close_icon = false,
        diagnostics = 'nvim_lsp', -- 显示错误图标
      },
    }
  end,
}
