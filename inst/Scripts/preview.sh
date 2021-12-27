#!/bin/sh
# From https://apple.stackexchange.com/questions/233945/opening-a-specific-page-on-mac-preview-from-terminal
osascript -e 'tell application "Preview" to activate' \
              -e 'delay 0.25' \
              -e 'tell application "System Events" to tell process "Preview" to click menu item "Go to Page…" of menu "Go" of menu bar 1' \
              -e 'delay 0.25' \
              -e "tell application \"System Events\" to keystroke \"$2\"" \
              -e 'delay 0.25' \
              -e 'tell application "System Events" to key code 36'
