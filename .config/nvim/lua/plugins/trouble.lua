return {
  "folke/trouble.nvim",
  keys = {
    {
      "<leader>cs",
      "<cmd>Trouble symbols toggle focus=false win.position=right win.size.width=50<cr>",
      desc = "Symbols (Trouble)",
    },
    {
      "<leader>cS",
      "<cmd>Trouble lsp toggle focus=false win.position=right win.size.width=50<cr>",
      desc = "LSP references/definitions/... (Trouble)",
    },
  },
}
