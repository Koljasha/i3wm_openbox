#!/bin/bash

# show:
# $change_brightness
# change:
# $ change_brightness +0.05 or $ change_brightness -0.05

brightness=`xrandr --verbose | grep -i brightness | cut -d':' -f2 | cut -c2-`

if (( $# == 0 )); then
    echo $brightness | awk '{ print $1*100"%" }'
    exit 0
fi

params=`echo $1`

operator=`echo $params | cut -c1`
value=`echo $params | cut -c2-`

if [[ "$operator" == "+" ]]; then
    brightness=`echo "$brightness $value" | awk '{ print $1+$2 }'`
elif [[ "$operator" == "-" ]]; then
    brightness=`echo "$brightness $value" | awk '{ print $1-$2 }'`
fi

xrandr --output eDP-1 --brightness $brightness
