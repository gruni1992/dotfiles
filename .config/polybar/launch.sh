#!/usr/bin/env sh

sleep 10
# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# left=$(xrandr --listactivemonitors | grep -v eDP-1 | grep -v "Monitors" | sort -t"+" -nk3 | cut -d" " -f6 | sed -n 1p)
# right=$(xrandr --listactivemonitors | grep -v eDP-1 | grep -v "Monitors" | sort -t"+" -nk3 | cut -d" " -f6 | sed -n 2p)
# MONITOR=$left polybar left &
# MONITOR=$right polybar right &

combined=$(xrandr --listactivemonitors | grep -v eDP-1 | grep -v "Monitors" | sort -t"+" -nk3 | cut -d" " -f6 | sed -n 2p)
MONITOR=$combined polybar -c $HOME/.config/polybar/config.ini combined &

