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
    -- opts = { style = "moon", transparent = true },
  },
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    opts = {
      --   contrast = "soft",
      transparent_mode = true,
    },
  },
  { "arcticicestudio/nord-vim" },
  {
    "rebelot/kanagawa.nvim",
    -- opts = {
    --   transparent = true,
    --   dimInactive = true,
    --   colors = {
    --     palette = {
    --       carpYellow = "#FFDD44",
    --       oniViolet = "#5566AA",
    --       sakuraPink = "#AADDCC",
    --     },
    --   },
    --   overrides = function(colors)
    --     local theme = colors.theme
    --     return {
    --       NormalFloat = { bg = "none" },
    --       NormalNC = { bg = "none" },
    --       DiagnosticSignInfo = { bg = "none" },
    --       TelescopeBorder = { bg = "none" },
    --       FloatBorder = { bg = "none" },
    --       FloatTitle = { bg = "none" },
    --
    --       -- Save an hlgroup with dark background and dimmed foreground
    --       -- so that you can use it where your still want darker windows.
    --       -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
    --       NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
    --
    --       -- Popular plugins that open floats will link to NormalFloat by default;
    --       -- set their background accordingly if you wish to keep them dark and borderless
    --       LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
    --       MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
    --       Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
    --       PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
    --       PmenuSbar = { bg = theme.ui.bg_m1 },
    --       PmenuThumb = { bg = theme.ui.bg_p2 },
    --     }
    --   end,
    -- },
  },
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    config = function()
      vim.g.gruvbox_material_enable_italic = true
      -- vim.g.gruvbox_material_transparent_background = 2
      vim.g.gruvbox_material_better_performance = 1
      vim.g.gruvbox_material_background = "hard"
      vim.g.gruvbox_material_float_style = "dim"
      vim.g.gruvbox_material_diagnostic_virtual_text = "colored"
    end,
  },
  {
    "EdenEast/nightfox.nvim",
    opts = {
      options = {
        styles = {
          comments = "italic",
          conditionals = "italic",
          keywords = "italic,bold",
          types = "italic,bold",
          -- variables = "bold",
          -- functions = "italic",
        },
        colorblind = {
          enable = true,
          -- simulate_only = true,
          severity = {
            deutan = 1.0,
            protan = 0.7,
            -- tritan = 0.1,
          },
        },
        transparent = true,
        modules = {
          cmp = true,
          gitsigns = true,
          dap_ui = true,
          dashboard = true,
          fidget = true,
          illuminate = true,
          lazy = true,
          neotest = true,
          neogit = true,
          notify = true,
          telescope = true,
          whichkey = true,
        },
      },
    },
  },
  -- {
  --   dir = "/Users/al.colmenar/dev/personal/base16-builder-rust-colorblind/downloads/templates/base16-nvim",
  --   name = "base16-nvim-deutan",
  -- },
  -- { "bradcush/nvim-base16" },
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      -- transparent = true,
      italic_comments = true,
    },
  },
  { "ofirgall/ofirkai.nvim" },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    opts = {
      styles = {
        transparency = true,
      },
    },
  },
  {
    "AlexvZyl/nordic.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "eldritch-theme/eldritch.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
    },
  },
  {
    "Skardyy/makurai-nvim",
    lazy = false,
    -- config = function()
    --   -- you don't have to call setup
    --   require("makurai").setup({
    --     transparent = true, -- removes the bg color
    --   })
    -- end,
  },
  -- {
  --   "miikanissi/modus-themes.nvim",
  --   priority = 1000,
  --   opts = {
  --     variant = "deuteranopia",
  --   },
  -- },
  -- Using lazy.nvim
  {
    "fnune/standard",
    lazy = false,
    priority = 1000,
    config = function()
      require("standard").setup({})
    end,
  },
  {
    "nyoom-engineering/oxocarbon.nvim",
  },
  {
    "wtfox/jellybeans.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "sainnhe/sonokai",
    lazy = false,
    priority = 1000,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      vim.g.sonokai_enable_italic = true
      -- vim.g.sonokai_transparent_background = 1
      -- vim.g.sonokai_style = "espresso"
    end,
  },
  {
    "S-Spektrum-M/odyssey.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "zenbones-theme/zenbones.nvim",
    -- Optionally install Lush. Allows for more configuration or extending the colorscheme
    -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
    -- In Vim, compat mode is turned on as Lush only works in Neovim.
    dependencies = "rktjmp/lush.nvim",
    lazy = false,
    priority = 1000,
    -- you can set set configuration options here
    -- config = function()
    --     vim.g.zenbones_darken_comments = 45
    --     vim.cmd.colorscheme('zenbones')
    -- end
  },
  {
    "pineapplegiant/spaceduck",
  },
  { "loctvl842/monokai-pro.nvim" },
  {
    "Mofiqul/vscode.nvim",
    opts = {
      transparent = false,
    },
  },
  { "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },
  {
    "Mofiqul/dracula.nvim",
    opts = {
      -- transparent_bg = true,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "makurai_dark",
      -- colorscheme = "makurai_less",
      -- colorscheme = "default",
      -- colorscheme = "tokyonight",
      -- colorscheme = "moonfly",
      colorscheme = "dracula",
      -- colorscheme = "rose-pine-test",
      -- colorscheme = "eldritch",
      -- colorscheme = "standard",
      -- colorscheme = "sonokai",
      -- colorscheme = "carbonfox",
      -- colorscheme = "spaceduck",
      -- colorscheme = "gruvbox",
      -- colorscheme = "monokai-pro",
      -- colorscheme = "kanagawa",
      -- colorscheme = "vscode",
    },
  },
}
