return {
  "pwntester/octo.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    -- OR 'ibhagwan/fzf-lua',
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("octo").setup({ enable_builtin = true })
  end,

  keys = {
    { "<leader>o", "", desc = "+octo" },
    { "<leader>oo", "<cmd>Octo<cr>", desc = "Command search" },
    { "<leader>op", "<cmd>Octo pr list<cr>", desc = "PR list" },
    { "<leader>om", "<cmd>Octo search is:pr is:open user-review-requested:@me<cr>", desc = "Requested PR list" },
  },
}
