return {
  "neovim/nvim-lspconfig",
  init = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    -- disable a keymap
    keys[#keys + 1] = { "<c-k>", false, mode = "i" }
    -- keys[#keys + 1] = { "gd", false }

    vim.g.python3_host_prog = "/Users/alcolmenar/.pyenv/versions/py3nvim/bin/python"
  end,
}
