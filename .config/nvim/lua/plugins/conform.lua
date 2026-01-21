return {
  "stevearc/conform.nvim",
  opts = {
    default_format_opts = {
      timeout_ms = 10000,
    },
    formatters_by_ft = {
      java = { "google-java-format" },
    },
  },
}
