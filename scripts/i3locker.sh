#!/bin/sh -e
# $ bash ~/.i3/scripts/i3locker.#!/bin/sh
    
## Color i3lock
backcolor="141A1B"
plaincolor="EEEEEEFF"
highcolor="2EB398FF"
errorcolor="DB5B5BFF"
linecolor="141A1BFF"

# connected monitors
screens="$(xrandr | grep " connected" | wc -l)"
# video player running
totem="$(pgrep totem | wc -l)"
# write info to lock-log.txt
echo "Locker:  $screens $totem $(date +%Y-%m-%d_%H:%M:%S) $1" >> /home/penn/.i3/scripts/lock-log.txt

i3lock -e --color=$backcolor --indicator --force-clock \
--insidevercolor=$highcolor --insidewrongcolor=$errorcolor --insidecolor=$highcolor \
--ringvercolor=$plaincolor --ringwrongcolor=$errorcolor --ringcolor=2EB398FF \
--linecolor=$linecolor --keyhlcolor=$plaincolor --bshlcolor=$errorcolor --separatorcolor=$linecolor \
--veriftext="" --wrongtext="" --noinputtext="" --locktext="" --lockfailedtext="" \
--datestr="%a %Y-%m-%d" --time-font=Monospace --date-font=Monospace

# Turn the screen off after a delay.
if [[ $1 = "dark" ]]; then
    sleep 10; pgrep i3lock && xset dpms force off
fi


