return {
  "elixir-tools/elixir-tools.nvim",
  version = "*",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local elixir = require("elixir")
    local elixirls = require("elixir.elixirls")

    elixir.setup({
      nextls = {
        enable = false,
        init_options = {
          mix_env = "dev",
          mix_target = "host",
          experimental = {
            completions = {
              enable = true,
            },
          },
          extensions = {
            credo = {
              enable = false,
            },
          },
        },
      },
      credo = { enable = true },
      elixirls = {
        enable = true,
        tag = "v0.23.0",
        settings = elixirls.settings({
          dialyzerEnabled = false,
          enableTestLenses = false,
          suggestSpecs = false,
          fetchDeps = true,
        }),
        on_attach = function(client, bufnr)
          vim.keymap.set("n", "<space>fp", ":ElixirFromPipe<cr>", { buffer = true, noremap = true })
          vim.keymap.set("n", "<space>tp", ":ElixirToPipe<cr>", { buffer = true, noremap = true })
          vim.keymap.set("v", "<space>em", ":ElixirExpandMacro<cr>", { buffer = true, noremap = true })
        end,
      },
    })
  end,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}
