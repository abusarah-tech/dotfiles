return {
  { "ellisonleao/gruvbox.nvim" },
  { "techtuner/aura-neovim" },
  { "ribru17/bamboo.nvim" },
  {
    "sainnhe/sonokai",
    config = function()
      vim.g.sonokai_style = "default"
      vim.g.sonokai_enable_italic = true
    end,
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "sonokai",
    },
  },
}
