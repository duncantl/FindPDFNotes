#William Denman
# https://stackoverflow.com/questions/2057595/how-do-you-open-a-pdf-at-a-specific-page-from-the-command-line-osx-or-linux
#
# Needs the full expanded path to the file, e.g., no ~/ or ../
#
on run argv
    set fileName to (item 1 of argv)
    set pageNum to (item 2 of argv) as integer

    tell application "Skim"
        open fileName
        tell document 1 to go to page pageNum
        activate
    end tell
end run
