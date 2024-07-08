return {
  "ibhagwan/fzf-lua",
  keys = {
    {
      "<leader>fc",
      LazyVim.pick("files", { cwd = vim.fn.getenv("HOME") .. "/.config", follow = true }),
      desc = "Find Config File",
    },
  },
}
