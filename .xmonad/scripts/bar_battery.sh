#!/bin/bash

. $(dirname $0)/config.sh

function battery_color {
    BAT_PERC="$1"
    STATUS="$2"
    TIME="$3"
    if [ "$BAT_PERC" -lt "10" ]; then
	COLOR="^fg($warning)"
    elif [ "$BAT_PERC" -lt "40" ]; then
	COLOR="^fg(#FF8C00)"
    else
	COLOR="^fg(#32CD32)"
    fi

    ret="$COLOR$BAT_PERC%^fg()"

    # If discharging, show time left
    if [ "$STATUS" = "Discharging" ]; then
	TIME_LEFT=$(echo "$TIME" | sed 's/\([0-9]*:[0-9]*\).*/\1/')
	ret="$ret ($TIME_LEFT)"
    fi
    echo "$ret"
}

BAT=$(acpi -b | awk '{gsub(/%,/,""); print $4}' | sed 's/%//g')
STATUS=$(acpi -b | awk '{gsub(/,/,""); print $3}')

# Time left
TIME0=$(acpi -b | awk '{gsub(/%,/,""); print $5}' | head -n1)
TIME1=$(acpi -b | awk '{gsub(/%,/,""); print $5}' | tail -n1)

BAT0_PERC=$(echo $BAT | awk '{print $1}')
BAT1_PERC=$(echo $BAT | awk '{print $2}')

# Discharging | Full
STATUS0=$(echo $STATUS | awk '{print $1}')
STATUS1=$(echo $STATUS | awk '{print $2}')

BAT0=$(battery_color "$BAT0_PERC" "$STATUS0" "$TIME0")
BAT1=$(battery_color "$BAT1_PERC" "$STATUS1" "$TIME1")

echo "Bat0: $BAT0 Bat1: $BAT1"
