return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    opts.sections.lualine_b = {
      { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
      { LazyVim.lualine.pretty_path() },
      -- { "filename" },
    }

    table.remove(opts.sections.lualine_c, 3)
    table.remove(opts.sections.lualine_c, 3)

    table.insert(opts.sections.lualine_y, 1, { "branch" })
    return opts
  end,
}
