return {
  "alcolmenar/git-worktree.nvim",
  dependencies = {
    {
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
    },
  },
  keys = {
    { "<leader>gw", "", desc = "+worktree" },
    {
      "<leader>gww",
      "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<cr>",
      desc = "Get Worktrees",
    },
    {
      "<leader>gwc",
      "<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>",
      desc = "Create new worktree",
    },
  },
}
