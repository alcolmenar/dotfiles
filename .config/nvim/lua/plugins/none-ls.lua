return {
  "nvimtools/none-ls.nvim",
  opts = function(_, opts)
    local nls = require("null-ls").builtins
    opts.sources = {
      nls.diagnostics.buf,
      nls.formatting.buf,
      nls.diagnostics.fish,
      nls.formatting.fish_indent,
      nls.diagnostics.credo,
      --   .with({
      --   extra_args = { "--strict" },
      -- }),
    }
    -- opts.debug = true
    return opts
  end,
}
