local internal_conf = require("vague.config.internal")
local M = {}

M.set_highlights = function()
  local c = internal_conf.current.colors
  vim.g.terminal_color_0 = c.line -- black
  vim.g.terminal_color_1 = c.error -- red
  vim.g.terminal_color_2 = c.plus -- green
  vim.g.terminal_color_3 = c.warning -- yellow
  vim.g.terminal_color_4 = c.keyword -- blue
  vim.g.terminal_color_5 = c.parameter -- purple
  vim.g.terminal_color_6 = c.constant -- cyan
  vim.g.terminal_color_7 = c.fg -- white
  vim.g.terminal_color_8 = c.comment -- gray
  for i, color in ipairs(c.brights) do
    vim.g["terminal_color_" .. (i + 8)] = color
  end
end
return M
