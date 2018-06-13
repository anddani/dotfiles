#!/bin/bash

. $(dirname $0)/config.sh
XPOS="1030"
WIDTH="180"
LINES="8"
WLAN_IF="wlp4s0"

essid=$(iwconfig $WLAN_IF | sed -n "1p" | awk -F '"' '{print $2}')
mode=$(iwconfig $WLAN_IF | sed -n "1p" | awk '{print $3}')
freq=$(iwconfig $WLAN_IF | sed -n "2p" | awk '{print $2}' | cut -d":" -f2)
mac=$(iwconfig $WLAN_IF | sed -n "2p" | awk '{print $6}')
qual=$(iwconfig $WLAN_IF | sed -n "6p" | awk '{print $2}' | cut -d"=" -f2)
lvl=$(iwconfig $WLAN_IF | sed -n "6p" | awk '{print $4}' | cut -d"=" -f2)
rate=$(iwconfig $WLAN_IF | sed -n "3p" | awk -F "=" '{print $2}' | cut -d" " -f1)
inet=$(ip addr show $WLAN_IF | grep -Po 'inet \K[\d.]+')

(echo " ^fg($white)Network";
 echo " ^fg($highlight)$essid";
 echo " Freq: ^fg($highlight)$freq GHz ^fg() Band: ^fg($highlight)$mode"
 echo " Down: ^fg($highlight)$rate MB/s  ^fg() Quality: ^fg($highlight)$qual"
 echo " IP: ^fg($white)$inet"
 echo " MAC: ^fg($highlight)$mac"
 echo " "
 sleep 10) | dzen2 -fg $foreground -bg $background -fn $FONT -x $XPOS -y $YPOS -w $WIDTH -l $LINES -e 'onstart=uncollapse,hide;button1=exit;button3=exit'
