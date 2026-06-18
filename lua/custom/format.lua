return {
  notify_on_error = false,
  format_on_save = false,
  formatters_by_ft = {
    lua = { 'stylua' },
    c = { 'clang_format' },
    cpp = { 'clang_format' },
    -- Conform can also run multiple formatters sequentially
    -- python = { "isort", "black" },
    markdown = { 'prettier' },
    -- You can use 'stop_after_first' to run the first available formatter from the list
    -- javascript = { "prettierd", "prettier", stop_after_first = true },
  },
  formatters = {
    -- prettier = {
    --   prepend_args = { '--prose-wrap', 'always', '--print-width', '80' },
    -- },
  },
}
