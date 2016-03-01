#!/bin/bash
xrdb -merge ~/.Xresources
xmodmap ~/.Xmodmap
/usr/bin/dropbox &
exec i3
