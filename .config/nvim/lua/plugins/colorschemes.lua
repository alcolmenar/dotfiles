return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      transparent_background = true,
    },
  },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = { style = "moon", transparent = true },
  },
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    opts = {
      contrast = "soft",
      transparent_mode = true,
    },
  },
  { "arcticicestudio/nord-vim" },
  {
    "rebelot/kanagawa.nvim",
    opts = {
      transparent = true,
      dimInactive = true,
      overrides = function(colors)
        local theme = colors.theme
        return {
          NormalFloat = { bg = "none" },
          NormalNC = { bg = "none" },
          DiagnosticSignInfo = { bg = "none" },
          TelescopeBorder = { bg = "none" },
          FloatBorder = { bg = "none" },
          FloatTitle = { bg = "none" },

          -- Save an hlgroup with dark background and dimmed foreground
          -- so that you can use it where your still want darker windows.
          -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
          NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

          -- Popular plugins that open floats will link to NormalFloat by default;
          -- set their background accordingly if you wish to keep them dark and borderless
          LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
          MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
          Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
          PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
          PmenuSbar = { bg = theme.ui.bg_m1 },
          PmenuThumb = { bg = theme.ui.bg_p2 },
        }
      end,
    },
  },
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    config = function()
      vim.g.gruvbox_material_enable_italic = true
      vim.g.gruvbox_material_transparent_background = 2
      vim.g.gruvbox_material_better_performance = 1
      vim.g.gruvbox_material_background = "hard"
      vim.g.gruvbox_material_float_style = "dim"
      vim.g.gruvbox_material_diagnostic_virtual_text = "colored"
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
