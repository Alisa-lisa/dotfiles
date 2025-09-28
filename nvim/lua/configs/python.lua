local vm = vim.api
local augroup = vm.nvim_create_augroup("Python", { clear = true })

-- Format on save for Python files
vm.nvim_create_autocmd("BufWritePre", {
  group = augroup,
  pattern = "*.py",
  callback = function()
    vim.lsp.buf.format { async = false }
  end,
})

-- You can add other Python-specific settings here
