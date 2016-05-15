#!/bin/bash
xrdb -merge ~/.Xresources
xmodmap ~/.Xmodmap
/usr/bin/dropbox &
cat $HOME/.config/i3/config.base \
    $HOME/.config/i3/config.desktop > $HOME/.config/i3/config
exec i3
