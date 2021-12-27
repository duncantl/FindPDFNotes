showPage =
function(file, page)
{
    Open(file)
    skim(file, page)
}



Open
function (filename, app = character(), asOne = TRUE) 
{
    if (length(app)) 
        app = sprintf(" -a '%s'", app)
    else
        app = ""
    
    filename = path.expand(filename)
    ex = file.exists(filename)
    if (any(!ex)) {
        warning(sum(!ex), " files don't exist: ", paste(filename[!ex], 
            collapse = ", "))
        filename = filename[ex]
    }
    filename = gsub("'", "\\\\\\\\'", filename)
    if (asOne) 
        cmd = sprintf("open %s %s", app, paste(sprintf("'%s'", 
            filename), collapse = " "))
    else cmd = sprintf("open %s '%s'", app, filename)
    invisible(sapply(cmd, system))
}


