sysinfo =
function()    
{
    system("system_profiler -timeout 0 -xml -detailLevel full ", intern = TRUE)
}


skim =
function(file, page, script = system.file("Scripts/skim.scpt", package = "FindPDFNotes"))
    osaScript(file, page, script)

preview =
function(file, page, script = system.file("Scripts/preview.scpt", package = "FindPDFNotes"))
    osaScript(file, page, script)

osaScript =
function(file, page, script)
    system(sprintf("osascript %s %s %d", script, shQuote(path.expand(file)), as.integer(page)), intern = TRUE)



# Find the default handler for an app.
# https://apple.stackexchange.com/questions/276408/terminal-command-to-list-application-defaults

#
# /System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -dump

# duti - installed
#  https://github.com/moretension/duti.git
#   run autoupdate to generate configure and then ./configure

# https://developer.apple.com/documentation/coreservices/launch_services

# system_profiler SPApplicationsDataType
