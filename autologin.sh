#!/bin/bash
set -ex
MAX_WAIT=3
INTERVAL=0.2
waited=0
trigg_macro() {
# Duration of sleep between actions
  SLEEP_DURATION=0.15
  # Open command menu in developer tools
  xdotool key Ctrl+Shift+p
  sleep $SLEEP_DURATION
  xdotool type "recorder"
  sleep $SLEEP_DURATION
  xdotool key Return
  sleep $SLEEP_DURATION
  for i in {1..7}
  do
      xdotool key Tab
      sleep 0.05
  done
  xdotool key Return
  sleep $SLEEP_DURATION
  xdotool key Ctrl+Return
  sleep 18
}
quit_dev_tool() {
  WINDOW_ID=$(xdotool search --name "devTools - app.zoom")

  # If the window ID is found, close the window
  if [ ! -z "$WINDOW_ID" ]; then
      wmctrl -ic "$WINDOW_ID"
  else
      echo "Window named 'devTools -' not found."
  fi
}
is_super_key_depressed() {
  super_keycode=133
  xinput query-state "$keyboard_id" | grep -q "key\[$super_keycode\]=up"
}
wait_until_super_depressed() {
  keyboard_id=$(xinput list | grep -i 'keyd virtual keyboard' | grep -Po 'id=\K\d+')
  while ! is_super_key_depressed; do
    sleep 0.05
  done
}
# ____________________main____________________
wait_until_super_depressed
# Open developer tools
xdotool key Ctrl+Shift+j

while (( $(echo "$waited < $MAX_WAIT" | bc -l) )); do # Loop until the maximum wait time is reached
  # Get the name of the currently focused window
  window_name=$(xdotool getwindowfocus getwindowname 2>/dev/null)

  # Check if the window name contains "DevTools - app"
  if [[ $window_name == *"DevTools - app"* ]]; then # if window appearred execute payload
    trigg_macro
    sleep 14
    quit_dev_tool
    exit 0
  fi
  # Wait for the interval
  sleep $INTERVAL
  # Increment the total wait time
  waited=$(echo "$waited + $INTERVAL" | bc)
done

# If the script reaches this point, it has waited for more than the maximum wait time
echo "Aborting script after $MAX_WAIT seconds"
exit 1
