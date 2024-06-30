return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    opts.sections.lualine_b = {
      {
        function()
          if vim.b.git_repo then
            return vim.b.git_repo
          end
          local git_dir = require("lualine.components.branch.git_branch").find_git_dir()
          local f_common_dir_stat = vim.loop.fs_stat(git_dir .. "/commondir")
          local config_path = git_dir
          local repo = ""
          if f_common_dir_stat then
            local f_commondir = io.open(git_dir .. "/commondir")
            if f_commondir then
              config_path = config_path .. "/" .. f_commondir:read()
              f_commondir:close()
            end
          end
          if vim.loop.fs_stat(config_path .. "/config") then
            local f_config = io.open(config_path .. "/config")
            if f_config then
              for c in f_config:lines() do
                local test = c:match("^%s*url%s*=.*/(.*)%.git$")
                if test then
                  repo = test
                  break
                end
              end
              f_config:close()
            end
          end
          vim.b.git_repo = repo
          return repo
        end,
        icon = "󰊢",
        color = { gui = "italic,bold" },
      },
      { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
      { LazyVim.lualine.pretty_path() },
    }

    table.remove(opts.sections.lualine_c, 3)
    table.remove(opts.sections.lualine_c, 3)

    table.insert(opts.sections.lualine_y, 1, { "branch" })
    return opts
  end,
}
