#!/bin/bash
. $(dirname $0)/config.sh
XPOS="1120"
WIDTH="120"
LINES="2"

# TODO: Support internal battery
bat1=$(acpi -b | sed -n "1p")
battime1=$(echo $bat1 | awk '{print $5}')
batperc1=$(echo $bat1 | awk '{print $4}' | sed 's/,//')
batstatus1=$(echo $bat1 | cut -d',' -f1 | awk '{print $3}')

#bat2=$(acpi -b | sed -n "2p")
#battime2=$(echo $bat1 | awk '{print $5}')
#batperc2=$(echo $bat1 | awk '{print $4}' | sed 's/,//')
#batstatus2=$(echo $bat1 | cut -d',' -f1 | awk '{print $3}')

(echo " ^fg($highlight)Battery";
 echo "  ^fg()$batstatus1";
 echo "  ^fg($highlight)$battime1 ^fg()left";
 sleep 15) | dzen2 -fg $foreground -bg $background -x $XPOS -y $YPOS -w $WIDTH -l $LINES -e 'onstart=uncollapse,hide;button1=exit;button3=exit'
