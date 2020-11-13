import Data.List

import XMonad
import XMonad.Util.CustomKeys
import XMonad.Util.Loggers
import XMonad.Util.Run

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.UrgencyHook

import XMonad.Layout.Gaps
import XMonad.Layout.Spacing
import XMonad.Layout.NoBorders

import System.Exit

import Graphics.X11.ExtraTypes.XF86

-- TODO: SetWMName
--

workSpaces = [ ("\xf109", "General")
             , ("\xf269", "Firefox")
             , ("\xf121", "Code")
             , ("\xf27A", "Discord")
             , ("", "Slack")
             , ("", "")
             , ("", "")
             , ("", "")
             , ("", "")
             ]

main = do
    xmproc <- spawnPipe "xmobar ~/.dotfiles/.xmonad/xmobar/xmobarrc.hs"
    xmonad $ withUrgencyHook NoUrgencyHook $ defaultConfig
        { terminal           = myTerminal
        , borderWidth        = myBorderWidth
        , focusedBorderColor = myFocusedBorderColor
        , handleEventHook    = myHandleEventHook
        , keys               = myKeys
        , layoutHook         = myLayoutHook
        , logHook            = myLogHook
        , manageHook         = myManageHook
        , modMask            = myModMask
        , normalBorderColor  = myNormalBorderColor
        , workspaces         = myWorkSpaces
        }

myTerminal      = "alacritty"
myModMask       = mod4Mask
myBorderWidth   = 3
gap = 4

-- Colors
myNormalBorderColor  = "#BFBFBF" -- Bright Grey
myFocusedBorderColor = "#CAA9FA" -- Purple
myXmobarFG           = "#282A36" -- Black
myXmobarBG           = "#FF79C6" -- Pink
myXmobarHiddenFG     = "#747C84" -- Dark Grey

myHandleEventHook = fullscreenEventHook
    <+> docksEventHook
    <+> handleEventHook defaultConfig

myLayoutHook = smartBorders
    $ smartSpacingWithEdge gap
    $ (tiled ||| Full)
        where
            tiled = avoidStruts $ Tall 1 (3/100) (1/2)

myManageHook :: ManageHook
myManageHook = manageDocks
    <+> (isFullscreen --> doFullFloat)
    <+> (className =? "Mpv" --> doFloat)
    <+> manageHook defaultConfig

myLogHook = dynamicLogString myXmobarPP >>= xmonadPropLog

myXmobarPP = def
  { ppCurrent = xmobarColor myXmobarBG "" . head . words
-- ppVisible
  , ppHidden  = xmobarColor myXmobarHiddenFG "" . head . words
  , ppSep     = " "
  , ppWsSep   = " "
  , ppExtras  = [prependWSLogger]
  , ppTitle   = const ""
  , ppLayout  = const ""
  }
  where
    prependIcon = (++) ":: " . last . words
    prependWSLogger = fmap prependIcon <$> logCurrent

myKeys = customKeys removedKeys addedKeys

removedKeys :: XConfig l -> [(KeyMask, KeySym)]
removedKeys XConfig { modMask = modm } =
    [ (modm .|. shiftMask, xK_q)
    ]

addedKeys :: XConfig l -> [((KeyMask, KeySym), X ())]
addedKeys conf @ XConfig { modMask = modm } =
    [ ((modm,               xK_Tab                  ), sendMessage NextLayout)
    , ((modm,               xK_space                ), spawn "rofi -modi drun -show drun")
    , ((modm,               xK_Return               ), spawn $ XMonad.terminal conf)
    , ((modm .|. shiftMask, xK_q                    ), kill)
    , ((modm .|. shiftMask, xK_e                    ), io $ exitWith ExitSuccess)
    , ((modm .|. shiftMask, xK_c                    ), spawn "emacs ~/.xmonad/xmonad.hs")
    , ((0,                  xF86XK_AudioLowerVolume ), spawn "amixer -q sset Master 5%-")
    , ((0,                  xF86XK_AudioRaiseVolume ), spawn "amixer -q sset Master 5%+")
    , ((0,                  xF86XK_AudioMute        ), spawn "amixer set Master toggle")
    , ((0,                  xF86XK_MonBrightnessUp  ), spawn "~/.dotfiles/scripts/modify_brightness.pl up")
    , ((0,                  xF86XK_MonBrightnessDown), spawn "~/.dotfiles/scripts/modify_brightness.pl down")
    ]

myWorkSpaces :: [String]
myWorkSpaces = map (\(a, (i, w)) -> show a ++ ":<fn=1>" ++ i ++ "</fn> " ++ w) $ zip [1..] workSpaces

quotes :: String -> String
quotes s = "'" ++ s ++ "'"

