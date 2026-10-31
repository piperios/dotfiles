local internal_conf = require("vague.config.internal")
local M = {}

vim.api.nvim_create_autocmd("OptionSet", {
  group = vim.api.nvim_create_augroup("VagueBackground", { clear = true }),
  pattern = "background",
  nested = true,
  callback = function()
    if vim.g.colors_name == "vague" then vim.cmd.colorscheme("vague") end
  end,
})

---@param user_opts? VagueColorscheme.Config
M.setup = function(user_opts)
  if user_opts then internal_conf.set(user_opts) end
end

-- SHOULD BE CALLED AFTER SETUP (unless using default colors)
M.get_palette = function()
  local palette = {}
  for name, color in pairs(internal_conf.current.colors) do
    palette[name] = color
  end
  return palette
end

--- Under the hood, |:colorscheme| is just using |:highlight GroupName ...| over every highlight group it knows about.
--- so this function is the equivalent to calling |:colorscheme| so use that instead
M._colorscheme = function()
  -- Only clear highlight groups if another colorscheme was already loaded.
  -- This improves startup time if the colorscheme is loaded in init.lua.
  if vim.g.colors_name then vim.cmd.highlight("clear") end
  vim.g.colors_name = "vague"
  internal_conf.current.colors = internal_conf.current.palettes[vim.o.background]

  require("vague.highlights").set_highlights()
  require("vague.terminal").set_highlights()
end

return M
