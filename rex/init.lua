rex.bind("cmd+ctrl+h", "pane.focus.left")
rex.bind("cmd+ctrl+j", "pane.focus.down")
rex.bind("cmd+ctrl+k", "pane.focus.up")
rex.bind("cmd+ctrl+l", "pane.focus.right")

rex.bind("cmd+ctrl+shift+h", "pane.move.left")
rex.bind("cmd+ctrl+shift+j", "pane.move.down")
rex.bind("cmd+ctrl+shift+k", "pane.move.up")
rex.bind("cmd+ctrl+shift+l", "pane.move.right")

rex.host{ label = "flow", endpoint = "https://flow.tailf18878.ts.net" }

rex.action{
  name  = "import_vague_themes",
  title = "Import Vague Themes",
  run   = function()
    local themes = os.getenv("HOME") .. "/.config/rex/themes/"
    rex.client.queue("client.theme.import", { path = themes .. "vague" })
    rex.client.queue("client.theme.import", { path = themes .. "vague-light" })
  end,
}
