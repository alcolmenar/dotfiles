return {
  "alcolmenar/git-worktree.nvim",
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
