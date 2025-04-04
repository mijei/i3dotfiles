#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
#polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

# Launch bar1 and bar2
#echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
#polybar bar1 2>&1 | tee -a /tmp/polybar1.log & disown

#echo "Bars launched..."

#!/usr/bin/env bash

# Kill any existing Polybar instances
killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Log start
echo "---" | tee -a /tmp/polybar.log

# Launch Polybar on your single monitor
polybar bar1 2>&1 | tee -a /tmp/polybar.log & disown

echo "Polybar launched!"
