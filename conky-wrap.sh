#/bin/sh

# Send the header so that i3bar knows we want to use JSON:
echo '{"version":1,"separator_block_width":10}'

# Begin the endless array.
echo '['

# We send an empty first array of blocks to make the loop simpler:
echo '[],'

# Now send blocks with information forever:
exec conky -c /home/penn/.i3/conky-json
