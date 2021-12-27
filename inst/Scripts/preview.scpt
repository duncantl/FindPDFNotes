# From https://apple.stackexchange.com/questions/233945/opening-a-specific-page-on-mac-preview-from-terminal

# You will have to grant your terminal (terminal, iTerm2, hyper, or whatever) accessibility privileges
# in Security & Privacy

on run argv
   set fileName to (item 1 of argv)
   set pageNum to (item 2 of argv) as integer
   
   tell application "Preview" to activate
#   delay 0.25 
   tell application "System Events" to tell process "Preview" to click menu item "Go to Page…" of menu "Go" of menu bar 1
#   delay 0.25 
   tell application "System Events" to keystroke pageNum
#   delay 0.25
   tell application "System Events" to key code 36
end run