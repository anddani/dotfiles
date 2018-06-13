#!/bin/bash

. $(dirname $0)/config.sh

XPOS="1250"
WIDTH="110"
LINES="12"

TIME=$(date | awk '{ print $4 }')
CALENDAR=$(cal -1)
DATEA=$(date +%a)
DATEB=$(date +%b)
DATED=$(date +%d)
DATEY=$(date +%Y)

(echo " ";
 echo "  ^fg($highlight)$datea $dateb $dated $datey";
 echo " ";
 echo "$CALENDAR";
 echo " ";
 echo "^fg($highlight) ^ca(1,~/.xmonad/scripts/dzen_date_prev.sh)PREV     ^ca()^ca(1,~/.xmonad/scripts/dzen_date_next.sh)      NEXT^ca()";
 sleep 15) | dzen2 -fg $foreground -bg $background -x $XPOS -y $YPOS -w $WIDTH -l $LINES -e 'onstart=uncollapse,hide;button1=exit;button3=exit'
