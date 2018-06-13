#!/bin/bash

. $(dirname $0)/config.sh

BAT=$(acpi -b | awk '{gsub(/%,/,""); print $4}' | sed 's/%//g')
STATUS=$(acpi -b | awk '{gsub(/,/,""); print $3}')
color=""

# TODO: Analyze which battery is active and show a (x/y)
BAT1=$(echo $BAT | awk '{print $1}')
# BAT2=$(echo $BAT | awk '{print $2}')

if [ "$BAT1" -lt "10"  ]; then
    ICON="bat_empty_01.xbm"
    color="^fg($warning)"
    BATBAR=$(echo -e "$BAT1" | gdbar -bg $bar_bg -fg $warning -h 4 -w 50)
else
    if [ "$BAT1" -lt "40" ]; then
	ICON="bat_low_01.xbm"
    else
	ICON="bat_full_01.xbm"
    fi
    BATBAR=$(echo -e "$BAT1" | gdbar -bg $bar_bg -fg $bar_fg -h 4 -w 50)
fi

if [[ $STATUS != "Discharging" ]]; then
    ICON="ac.xbm"
fi

ICON="^i($HOME/.xmonad/icons/$ICON)"
echo "$color$ICON $BATBAR"
