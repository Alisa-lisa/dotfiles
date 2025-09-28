vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)
-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"
require "configs.python"

-- pretty md -> pdf
require("typst-preview").setup {
  debug = false,

  -- open_cmd = 'firefox %s -P typst-preview --class typst-preview'
  open_cmd = nil,
  port = 8800,
  invert_colors = "auto",
  follow_cursor = true,
  dependencies_bin = {
    ["tinymist"] = nil,
    ["websocat"] = nil,
  },
  extra_args = nil,

  -- This function will be called to determine the root of the typst project
  get_root = function(path_of_main_file)
    local root = os.getenv "TYPST_ROOT"
    if root then
      return root
    end
    return vim.fn.fnamemodify(path_of_main_file, ":p:h")
  end,
  get_main_file = function(path_of_buffer)
    return path_of_buffer
  end,
}

require("nvim-tree").setup {
  on_attach = function(bufnr)
    local api = require "nvim-tree.api"

    -- Important: When you supply an `on_attach` function, nvim-tree won't
    -- automatically set up the default keymaps. To set up the default keymaps,
    -- call the `default_on_attach` function. See `:help nvim-tree-quickstart-custom-mappings`.
    api.config.mappings.default_on_attach(bufnr)

    local function opts(desc)
      return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    local preview = require "nvim-tree-preview"

    vim.keymap.set("n", "pp", preview.watch, opts "Preview (Watch)")
    vim.keymap.set("n", "<Esc>", preview.unwatch, opts "Close Preview/Unwatch")
    vim.keymap.set("n", "<C-f>", function()
      return preview.scroll(4)
    end, opts "Scroll Down")
    vim.keymap.set("n", "<C-b>", function()
      return preview.scroll(-4)
    end, opts "Scroll Up")

    -- Option A: Smart tab behavior: Only preview files, expand/collapse directories (recommended)
    vim.keymap.set("n", "<Tab>", function()
      local ok, node = pcall(api.tree.get_node_under_cursor)
      if ok and node then
        if node.type == "directory" then
          api.node.open.edit()
        else
          preview.node(node, { toggle_focus = true })
        end
      end
    end, opts "Preview")

    -- Option B: Simple tab behavior: Always preview
    -- vim.keymap.set('n', '<Tab>', preview.node_under_cursor, opts 'Preview')
  end,
}

vim.schedule(function()
  require "mappings"
end)
