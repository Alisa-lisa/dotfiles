-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local nvlsp = require "nvchad.configs.lspconfig"
nvlsp.defaults()
-- local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = {
  "html",
  "cssls",
  "ruff", -- my python lsp
  "rust_analyzer",
  "terraformls",
  "dartls",
  "taplo",
}

local overrides = {
  lua_ls = {
    settings = {
      Lua = {
        diagnostics = { globals = { "vim" } },
        workspace = { checkThirdParty = false },
      },
    },
  },
  ruff = {
    init_options = { settings = { args = {} } }, -- add ruff args here if you want
  },
}
-- lsps with default config
for _, name in ipairs(servers) do
  vim.lsp.config(
    name,
    vim.tbl_deep_extend("force", {
      on_attach = nvlsp.on_attach,
      capabilities = nvlsp.capabilities,
    }, overrides[name] or {})
  )

  vim.lsp.enable(name)
end
-- for _, lsp in ipairs(servers) do
--   lspconfig[lsp].setup {
--     on_attach = nvlsp.on_attach,
--     on_init = nvlsp.on_init,
--     capabilities = nvlsp.capabilities,
--   }
-- end

-- toml
-- lspconfig.taplo.setup {}

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
