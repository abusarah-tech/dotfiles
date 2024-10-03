-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.filetype.add({
  extension = {
    graphql = "graphql",
    gql = "graphql",
    typescript = "graphql",
    typescriptreact = "graphql",
  },
})

vim.g.clipboard = {
  name = "xclip-wsl",
  copy = {
    ["+"] = "xclip -selection clipboard",
    ["*"] = "xclip -selection primary",
  },
  paste = {
    ["+"] = "xclip -selection clipboard -o",
    ["*"] = "xclip -selection primary -o",
  },
  cache_enabled = 0,
}

vim.cmd([[set clipboard+=unnamedplus]])

vim.api.nvim_set_keymap("v", "<C-c>", '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-c>", '"+yy', { noremap = true, silent = true })
