sysinfo =
function()    
{
    system("system_profiler -timeout 0 -xml -detailLevel full ", intern = TRUE)
}


skim =
function(file, page, script = system.file("skim.scpt", package = "FindPDFNotes"))
   system(sprintf("osascript %s %s %d", script, shQuote(path.expand(file)), as.integer(page)), intern = TRUE)
