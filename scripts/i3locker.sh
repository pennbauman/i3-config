#!/bin/sh -e
# $ bash ~/.i3/scripts/i3locker.#!/bin/sh

## Blur i3lock
# Take a screenshot
#scrot /tmp/screen_locked.png
# Pixellate it 10x
#mogrify -scale 10% -scale 1000% /tmp/screen_locked.png
#mogrify /tmp/screen_locked.png -blur 0x8 /tmp/screen_locked.png
# Lock screen displaying this image.
#i3lock -i /tmp/screen_locked.png -e -u

## Color i3lock
backcolor="141A1B"
plaincolor="EEEEEEFF"
highcolor="2EB398FF"
errorcolor="DB5B5BFF"
linecolor="141A1BFF"

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