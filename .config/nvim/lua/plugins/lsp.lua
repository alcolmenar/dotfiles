return {
  "neovim/nvim-lspconfig",
  init = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    -- disable a keymap
    keys[#keys + 1] = { "<c-k>", false, mode = "i" }
    -- keys[#keys + 1] = { "gd", false }

    vim.g.python3_host_prog = "/Users/alcolmenar/.pyenv/versions/py3nvim/bin/python"
  end,
  opts = {
    servers = {
      lexical = {
        mason = false,
        cmd = { "/Users/al.colmenar/dev/3rd/lexical/_build/dev/package/lexical/bin/start_lexical.sh" },
      },
      tailwindcss = {
        hovers = true,
        suggestions = true,
        root_dir = function(fname)
          local root_pattern =
            require("lspconfig").util.root_pattern("tailwind.config.cjs", "tailwind.config.js", "postcss.config.js")
          return root_pattern(fname)
        end,
      },
    },
  },
}
