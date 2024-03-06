-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- vim.g.base16_background_transparent = 1
-- local set_theme_path = "$HOME/.config/tinted-theming/set_theme.lua"
-- local is_set_theme_file_readable = vim.fn.filereadable(vim.fn.expand(set_theme_path)) == 1 and true or false
--
-- if is_set_theme_file_readable then
--   vim.cmd("let base16colorspace=256")
--   vim.cmd("source " .. set_theme_path)
-- end

local base = require("base16-colorscheme")
base.with_config({
  telescope_borders = true,
})
base.load_from_shell()
