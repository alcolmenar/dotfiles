return {
  "ibhagwan/fzf-lua",
  keys = {
    { "<c-k>", ft = "fzf", mode = "t", false },
    {
      "<leader>fc",
      LazyVim.pick("files", { cwd = vim.fn.getenv("HOME") .. "/.config", follow = true }),
      desc = "Find Config File",
    },
  },
}
