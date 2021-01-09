#!/bin/bash

killall -q polybar
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done
polybar --config=$HOME/.config/polybar/config.ini top
# polybar --config=$HOME/.config/polybar/config.ini bottom
