return {
  "saghen/blink.cmp",
  dependencies = {
    { "saghen/blink.compat", lazy = true, version = false },
  },
  opts = {
    sources = {
      -- LazyVim as custom option copmpat to pass in external sources with blink.compat
      compat = { "obsidian", "obsidian_new", "obsidian_tags" },
      -- per_filetype = {
      --   codecompanion = { "codecompanion" },
      -- },
      -- default = { "codecompanion", "minuet" },
      -- default = { "codecompanion" },

      -- providers = {
      --   minuet = {
      --     name = "minuet",
      --     module = "minuet.blink",
      --     score_offset = 100,
      --   },
      -- },
    },
  },
}
