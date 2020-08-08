import XMonad
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run
import XMonad.Hooks.DynamicLog
import XMonad.Util.CustomKeys
import XMonad.Util.EZConfig

main = do
xmproc <- spawnPipe "xmobar -x 2"
xmonad $ defaultConfig
  { terminal = "xterm"
  , manageHook = manageDocks <+> manageHook defaultConfig
  , layoutHook = avoidStruts $ layoutHook defaultConfig
  , handleEventHook = handleEventHook defaultConfig <+> docksEventHook
  , logHook = dynamicLogWithPP $ defaultPP { ppOutput = hPutStrLn xmproc, ppOrder = \(ws:_:t:_) -> [ws,t] }
  , borderWidth = 3
  }
