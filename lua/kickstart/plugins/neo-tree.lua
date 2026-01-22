-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  keys = {
    {
      '\\',
      function()
        local source = vim.g.neotree_last_source
        if source == nil then
          source = 'filesystem'
        end
        local command = 'Neotree toggle ' .. source .. ' float'
        vim.cmd(command)
      end,
      desc = 'NeoTree reveal',
      silent = false,
    },
  },
  opts = {
    event_handlers = {
      {
        event = 'after_render',
        handler = function(state)
          if state.name == 'filesystem' or state.name == 'buffers' or state.name == 'git_status' then
            vim.g.neotree_last_source = state.name
          end
        end,
      },
    },
    source_selector = {
      winbar = true,
      statusline = false,
      sources = {
        { source = 'filesystem', display_name = ' 󰉓 Files ' },
        { source = 'buffers', display_name = ' 󰈙 Buffers ' },
        { source = 'git_status', display_name = ' 󰊢 Git ' },
      },
    },
    window = {
      position = 'float',
      mappings = {
        ['\\'] = 'close_window',
        ['h'] = 'prev_source',
        ['l'] = 'next_source',
      },
    },
  },
}
