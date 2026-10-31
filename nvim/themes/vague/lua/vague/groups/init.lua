---@param conf VagueColorscheme.InternalConfig
---@return table<string, table>
return function(conf)
  ---@param group string
  local function init(group) return require("vague.groups." .. group).get_colors(conf) end

  return {
    blink = init("blink"),
    cmp = init("cmp"),
    common = init("common"),
    dashboard = init("dashboard"),
    diff = init("diff"),
    fzf_lua = init("fzf-lua"),
    html = init("html"),
    lsp_native = init("lsp-native"),
    lsp_plugin = init("lsp-plugin"),
    mini = init("mini"),
    modes = init("modes"),
    neotest = init("neotest"),
    neotree = init("neotree"),
    rainbow_delimiters = init("rainbow-delimiters"),
    snacks_input = init("snacks-input"),
    snacks_picker = init("snacks-picker"),
    syntax = init("syntax"),
    telescope = init("telescope"),
    treesitter = init("treesitter"),
    vim_better_whitespace = init("vim-better-whitespace"),
  }
end
