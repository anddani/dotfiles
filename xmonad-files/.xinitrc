#!/bin/bash
xmodmap ~/.Xmodmap
export _JAVA_AWT_WM_NONREPARENTING=1
exec xmonad
