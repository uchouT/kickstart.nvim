local M = {}

-- 查找 ~/.vscode/extensions/vadimcn.vscode-lldb-*/adapter/codelldb
local function find_codelldb_path()
  local extension_dir = vim.fn.expand '~/.vscode/extensions'
  local uv = vim.loop
  local handle = uv.fs_scandir(extension_dir)
  local result = nil

  if handle then
    while true do
      local name, type = uv.fs_scandir_next(handle)
      if not name then
        break
      end
      if name:match '^vadimcn%.vscode%-lldb%-.+' then
        local path = extension_dir .. '/' .. name .. '/adapter/codelldb'
        if vim.fn.filereadable(path) == 1 then
          result = path
        end
      end
    end
  end

  return result
end

local codelldb_path = find_codelldb_path()

function M.setup(dap)
  dap.adapters.codelldb = {
    type = 'server',
    port = '${port}',
    executable = {
      command = codelldb_path,
      args = { '--port', '${port}' },
    },
  }

  dap.configurations.rust = {
    name = 'Lauch Rust app',
    type = 'codelldb',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. 'target/debug/', 'file')
    end,
    cwd = '{workspaceFolder}',
    stopOnEntry = false,
    args = {},
  }
end

return M
