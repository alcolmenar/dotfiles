return {
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    opts = {
      contrast = "hard",
      -- transparent_mode = true,
    },
  },
  { "arcticicestudio/nord-vim" },
  { "rebelot/kanagawa.nvim", opts = {
    transparent = true,
    dimInactive = true,
  } },
  { "sainnhe/gruvbox-material" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa",
    },
  },
}
