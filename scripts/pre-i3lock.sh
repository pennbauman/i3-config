#/bin/sh
# Pre i3lock

# connected monitors
screens="$(xrandr | grep " connected" | wc -l)"
# video player running
totem="$(pgrep totem | wc -l)"

#echo "Screens: $screens"
#echo "Videos:  $totem"

echo "PreLock: $screens $totem $(date +%Y-%m-%d_%H:%M:%S) $1" >> /home/penn/.i3/scripts/lock-log.txt

if !([[ $screens > 1 ]] || [[ $totem > 0 ]]); then
    xset dpms force off
fi