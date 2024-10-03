return {
  {
    "vhyrro/luarocks.nvim",
    priority = 1000, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
    config = true,
  },
  {
    "ellisonleao/dotenv.nvim",
    config = function()
      require("dotenv").setup({
        enable_on_load = true,
        verbose = false,
      })
    end,
  },
  {
    "folke/edgy.nvim",
    event = "VeryLazy",
    opts = {},
  },
  {
    "mhartington/formatter.nvim",
  },
  { "akinsho/toggleterm.nvim", version = "*", config = true },
  {
    "rbong/vim-flog",
    lazy = true,
    cmd = { "Flog", "Flogsplit", "Floggit" },
    dependencies = {
      "tpope/vim-fugitive",
    },
  },
  {
    "jparise/vim-graphql",
    ft = { "graphql", "typescript", "typescriptreact" },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        graphql = {
          filetypes = { "graphql", "typescript", "typescriptreact" },
          root_dir = function(fname)
            return require("lspconfig").util.root_pattern(
              ".graphqlrc.yaml",
              ".graphqlrc.yml",
              ".graphqlrc",
              ".graphql.config.js",
              ".graphql.config.ts",
              ".graphqlrc.js",
              ".graphqlrc.ts"
            )(fname) or require("lspconfig").util.find_git_ancestor(fname)
          end,
        },
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "graphql", "typescript" })
      end
      opts.highlight = {
        enable = true,
        additional_vim_regex_highlighting = { "graphql" },
      }
      opts.indent = { enable = true }
      opts.query_linter = {
        enable = true,
        use_virtual_text = true,
        lint_events = { "BufWrite", "CursorHold" },
      }
    end,
  },
}
