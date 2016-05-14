#!/bin/bash
xrdb -merge ~/.Xresources
xmodmap ~/.Xmodmap
/usr/bin/dropbox &
~/.dotfiles/archscripts/autolock &
exec i3
