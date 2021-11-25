import XMonad.Actions.OnScreen
import XMonad hiding ( (|||) )
import XMonad.Layout.LayoutCombinators (JumpToLayout(..), (|||))
import XMonad.Config.Desktop
import XMonad.Layout.Spacing
import XMonad.Layout.NoBorders
import XMonad.Layout.ResizableTile
import XMonad.Layout.GridVariants hiding (R, L)
import XMonad.Layout.BinarySpacePartition
import XMonad.Layout.Renamed (renamed, Rename(Replace))
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.InsertPosition
import XMonad.Hooks.EwmhDesktops
import XMonad.Util.SpawnOnce
import XMonad.Util.Run (spawnPipe)
import XMonad.Util.EZConfig(additionalKeysP)
import System.IO
import XMonad.StackSet

screenLeft = 0
screenRight = 0
myTerminal = "alacritty"
myBorderColor = "#1a73e8"
myTitleColor = "#80cee1"
myBorderWidth = 2
gapSize = 16

myWorkspaces = ["term", "2", "3","4","5","6","7","8","9", "0"]

myManageHook = composeAll
    [ className =? "Pavucontrol" --> doFloat
    , className =? "Nm-connection-editor" --> doFloat
    , className =? "Pavucontrol" --> doFloat
    , className =? "Gnome-calculator" --> doFloat
    , className =? "Matplotlib" --> doFloat
    , manageDocks
    ]

myStartupHook = do
    spawnOnce "nm-applet &"
    spawnOnce "blueman-applet &"
    spawnOnce "trayer --edge top --align right --widthtype request --padding 6 --SetDockType true --SetPartialStrut true --transparent true --alpha 60 --tint 0x282c34  --height 22 --monitor 1 --expand true & "
    windows (viewOnScreen screenLeft "1")
    --windows (viewOnScreen screenRight "7")

main = do
    xmproc <- spawnPipe "xmobar -x 0 $HOME/.xmobarrc0"
    --xmproc1 <- spawnPipe "xmobar -x 1 $HOME/dotfiles/xmobarrc1"
    xmonad $ ewmh desktopConfig { 
        --manageHook = insertPosition Below Newer <+> myManageHook <+> manageHook defaultConfig
        manageHook = myManageHook <+> manageHook defaultConfig
        , modMask = mod4Mask
        , terminal = myTerminal
        , XMonad.workspaces = myWorkspaces
        , startupHook = myStartupHook
        , borderWidth = myBorderWidth
        , focusedBorderColor = myBorderColor
        , layoutHook = myLayout
        , logHook = dynamicLogWithPP xmobarPP
            --{ ppOutput = \x -> hPutStrLn xmproc x >> hPutStrLn xmproc1 x
            { ppOutput = \x -> hPutStrLn xmproc x 
            , ppTitle = xmobarColor myTitleColor "" . shorten 80
            }
        } `additionalKeysP` myKeys


myKeys :: [(String, X ())]
myKeys = [("M-1", windows (viewOnScreen screenLeft "term"))
    , ("M-2", windows (viewOnScreen screenLeft "2"))
    , ("M-3", windows (viewOnScreen screenLeft "3"))
    , ("M-4", windows (viewOnScreen screenLeft "4"))
    , ("M-5", windows (viewOnScreen screenLeft "5"))
    , ("M-6", windows (viewOnScreen screenRight "6"))
    , ("M-7", windows (viewOnScreen screenRight "7"))
    , ("M-8", windows (viewOnScreen screenRight "8"))
    , ("M-9", windows (viewOnScreen screenRight "9"))
    , ("M-0", windows (viewOnScreen screenRight "0"))
    , ("M-o", sendMessage $ JumpToLayout "Full")
    --, ("M-p", spawn "dmenu_run -fn 'xft:Noto Sans Mono-13:Normal' -m " ++ gets (screen . current))
    , ("M-p", spawn "dmenu_run -fn 'xft:Noto Sans Mono-13:Normal'")
    , ("M-f", spawn "firefox")
    , ("M-v", spawn "virt-manager")
    , ("M-i d", spawn "redshift -x")
    , ("M-i a", spawn "redshift -P -O 2000")
    , ("M-i n", spawn "redshift -P -O 1750")
    , ("M-<Print>", spawn "flameshot gui")
    , ("M-<Pause>", spawn "xscreensaver-command -lock")
    , ("M-<KP_Subtract>", sequence_ [decScreenSpacing 5, decWindowSpacing 5])
    , ("M-<KP_Add>", sequence_ [incScreenSpacing 5, incWindowSpacing 5])
    --, ("M-u", sendMessage ToggleStruts)
    ]


myLayout = avoidStruts (full ||| tiled ||| grid)
    where
        full = renamed [Replace "Full"]
            $ noBorders (Full)
        tiled = renamed [Replace "Tall"]
            $ spacingRaw False (Border gapSize 0 0 gapSize) True (Border 0 gapSize gapSize 0) True
            $ ResizableTall 1 (3/100) (1/2) []

        grid = renamed [Replace "Grid"]
            $ spacingRaw False (Border gapSize 0 0 gapSize) True (Border 0 gapSize gapSize 0) True
            $ Grid (16/10)

	--bsp = renamed [Replace "BSP"]
	--	$ emptyBSP

        nmaster = 1
        ratio = 1/2
        delta = 3/100
