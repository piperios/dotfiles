local internal_conf = require("vague.config.internal")
local build_groups = require("vague.groups")
local M = {}

M.set_highlights = function()
  local conf = internal_conf.current
  local highlights = {}
  for _, group in pairs(build_groups(conf)) do
    for hl, settings in pairs(group) do
      highlights[hl] = settings
    end
  end

  -- Allow user to add or override any highlight groups
  conf.on_highlights(highlights, conf.colors)

  for hl, settings in pairs(highlights) do
    vim.api.nvim_set_hl(0, hl, settings)
  end
end

return M
