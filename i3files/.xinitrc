#!/bin/bash
xrdb -merge ~/.Xresources
xmodmap ~/.Xmodmap
/usr/bin/dropbox &
~/.dotfiles/autolock &
exec i3
