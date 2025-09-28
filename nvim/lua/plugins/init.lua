return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- language servers
  {
    "neovim/nvim-lspconfig",
    dependecies = {
      "jose-elias-alvarez/null-ls.nvim",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {},
  },

  {
    -- Show trailing spaces
    "kaplanz/retrail.nvim",
    lazy = false,
    opts = {}, -- calls `setup` using provided `opts`
  },

  -- Navigation
  {
    -- Tree view
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      {
        "b0o/nvim-tree-preview.lua",
        dependencies = {
          "nvim-lua/plenary.nvim",
          "3rd/image.nvim", -- Optional, for previewing images
        },
      },
    },
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    lazy = false,
    opts = {},
  },

  {
    "nvim-telescope/telescope.nvim",
    lazy = false,
    dependecies = {
      "nvim-lua/plenary.nvim",
    },
  },

  {
    "chomosuke/typst-preview.nvim",
    lazy = false, -- or ft = 'typst'
    version = "1.*",
    opts = {}, -- lazy.nvim will implicitly calls `setup {}`
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "css",
        "html",
        "hyprlang",
        "just",
        "lua",
        "markdown",
        "python",
        "rust",
        "terraform",
        "typescript",
        "typst",
        "vim",
        "vimdoc",
        "yaml",
      },
    },
  },
}
