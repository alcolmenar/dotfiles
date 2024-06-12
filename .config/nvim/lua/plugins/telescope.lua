return {
  "nvim-telescope/telescope.nvim",
  opts = function()
    local actions = require("telescope.actions")
    return {
      defaults = {
        mappings = {
          i = {
            ["<C-k>"] = actions.close,
          },
        },
      },
      extensions = {
        git_worktree = {},
      },
    }
  end,
  keys = {
    {
      "<leader>fc",
      require("lazyvim.util").pick("find_files", { cwd = vim.fn.getenv("HOME") .. "/.config", follow = true }),
      desc = "Find Config File",
    },
  },
}
