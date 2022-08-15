#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload main 2>&1 | tee -a /tmp/polybar1.log & disown
  done
else
  polybar --reload main 2>&1 | tee -a /tmp/polybar1.log & disown
fi

echo "Bars launched..."
