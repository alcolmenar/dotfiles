return {
  "nvim-neotest/neotest",
  optional = true,
  dependencies = {
    "jfpedroza/neotest-elixir",
  },
  opts = {
    adapters = {
      ["neotest-elixir"] = {},
    },
  },
  keys = {
    {
      "<leader>ta",
      function()
        local neotest = require("neotest")
        neotest.run.attach()
      end,
      desc = "Attach",
    },
  },
}
