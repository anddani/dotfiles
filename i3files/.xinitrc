#!/bin/bash
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
xmodmap ~/.Xmodmap
udiskie -2 -s &
/usr/bin/dropbox &
cat $HOME/.config/i3/config.base \
    $HOME/.config/i3/config.desktop > $HOME/.config/i3/config
nm-applet &
exec i3
