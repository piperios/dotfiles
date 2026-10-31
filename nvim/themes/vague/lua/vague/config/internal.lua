local M = {}

---@class VagueColorscheme.InternalConfig
local DEFAULT_SETTINGS = {

  ---@type boolean
  transparent = false,
  ---@type boolean
  bold = true,
  ---@type boolean
  italic = true,

  ---@param highlights table<string, vim.api.keyset.highlight>
  ---@param colors VagueColorscheme.InternalConfig.colors
  on_highlights = function(highlights, colors) end,

  ---@class VagueColorscheme.InternalConfig.colors
  palettes = {
    dark = {
      ---@type string
      bg = "#141415",
      ---@type string
      inactiveBg = "#1c1c24",
      ---@type string
      fg = "#cdcdcd",
      ---@type string
      floatBorder = "#878787",
      ---@type string
      line = "#252530",
      ---@type string
      comment = "#606079",
      ---@type string
      builtin = "#b4d4cf",
      ---@type string
      func = "#c48282",
      ---@type string
      string = "#e8b589",
      ---@type string
      number = "#e0a363",
      ---@type string
      property = "#c3c3d5",
      ---@type string
      constant = "#aeaed1",
      ---@type string
      parameter = "#bb9dbd",
      ---@type string
      visual = "#333738",
      ---@type string
      error = "#d8647e",
      ---@type string
      warning = "#f3be7c",
      ---@type string
      hint = "#7e98e8",
      ---@type string
      operator = "#90a0b5",
      ---@type string
      keyword = "#6e94b2",
      ---@type string
      type = "#9bb4bc",
      ---@type string
      search = "#405065",
      ---@type string
      plus = "#7fa563",
      ---@type string
      delta = "#f3be7c",
      diffAdd = "#293125",
      diffChange = "#41362a",
      diffDelete = "#3b242a",
      diffText = "#6D583E",
      brights = { "#e08398", "#99b782", "#f5cb96", "#8ba9c1", "#c9b1ca", "#bebeda", "#d7d7d7" },
    },
    light = {
      bg = "#f3f4f7",
      inactiveBg = "#e9ebf2",
      fg = "#2a3140",
      floatBorder = "#8a90a0",
      line = "#d9dde8",
      comment = "#6a7288",
      builtin = "#2f7b6f",
      func = "#8d3f3f",
      string = "#9a5b1a",
      number = "#a65a15",
      property = "#4f5183",
      constant = "#5f629e",
      parameter = "#7e5f87",
      visual = "#c9d0df",
      error = "#b43d59",
      warning = "#a65a15",
      hint = "#4b6bb6",
      operator = "#5b6f88",
      keyword = "#3f6787",
      type = "#2f6f7d",
      search = "#adc0da",
      plus = "#3f7a38",
      delta = "#a65a15",
      diffAdd = "#d3ded5",
      diffChange = "#e5d8ce",
      diffDelete = "#e8d3db",
      diffText = "#d8bea8",
      brights = { "#99344c", "#366830", "#8d4c12", "#365873", "#6b5173", "#515386", "#242a36" },
    },
  },
}

DEFAULT_SETTINGS.colors = DEFAULT_SETTINGS.palettes[vim.o.background]

M._DEFAULT_SETTINGS = DEFAULT_SETTINGS
M.current = M._DEFAULT_SETTINGS

local opts = type(vim.g.vague_colorscheme) == "function" and vim.g.vague_colorscheme() or vim.g.vague_colorscheme or {}

---@param user_opts VagueColorscheme.Config
M.set = function(user_opts) M.current = vim.tbl_deep_extend("force", vim.deepcopy(M.current), user_opts or opts) end

return M
