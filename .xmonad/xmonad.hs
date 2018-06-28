import XMonad
import XMonad.Util.CustomKeys
import XMonad.Util.Run

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.UrgencyHook

import XMonad.Layout.Gaps
import XMonad.Layout.Spacing
import XMonad.Layout.NoBorders
import XMonad.Hooks.EwmhDesktops

import System.Exit

import Graphics.X11.ExtraTypes.XF86

-- TODO: Add fonts?
myWorkspaceBar = "dzen2 -dock -x 0 -y 0 -w 1000 -ta l -fg '"++foreground++"' -bg '"++background++"'"
myStatusBar = "conky -qc ~/.xmonad/conkyrc | dzen2 -x 1000 -ta r -fg '"++foreground++"' -bg '"++background++"'"

main = do
    wsBar <- spawnPipe myWorkspaceBar
    statusBar <- spawnPipe myStatusBar
    spawn "feh --bg-fill ~/.wallpaper.jpg"
    xmonad $ withUrgencyHook NoUrgencyHook $ defaultConfig
        { terminal          = myTerminal
        , modMask           = myModMask
        , keys              = myKeys
        , borderWidth       = myBorderWidth
        , logHook           = myLogHook wsBar
        , handleEventHook   = myHandleEventHook
        , manageHook        = myManageHook
        , layoutHook        = myLayoutHook
        }

myTerminal      = "st"
myModMask       = mod1Mask
myBorderWidth   = 2

myHandleEventHook = fullscreenEventHook
    <+> docksEventHook
    <+> handleEventHook defaultConfig

myLayoutHook = avoidStruts
    $ smartBorders
    $ gaps [(U, 5), (D, 5), (R, 5), (L, 5)]
    $ (tiled ||| Full)
        where
            tiled = smartSpacing 2 $ Tall 1 (3/100) (1/2)

myManageHook :: ManageHook
myManageHook = manageDocks
    <+> manageHook defaultConfig

myLogHook h       = dynamicLogWithPP $ defaultPP
    { ppOutput          = hPutStrLn h
    , ppCurrent         = dzenColor "#303030" "#909090" . pad
    , ppHidden          = dzenColor "#909090" "" . pad
    , ppHiddenNoWindows = dzenColor "#606060" "" . pad
    , ppLayout          = dzenColor "#909090" "" . pad
    , ppUrgent          = dzenColor "#ff0000" "" . pad . dzenStrip
    , ppTitle           = shorten 100
    , ppWsSep           = ""
    , ppSep             = "  "
    }

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

background = "#FDF6E3"
foreground = "#839496"

