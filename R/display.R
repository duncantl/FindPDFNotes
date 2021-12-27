display =
function(x, ...)
    UseMethod("display")

display.PageNumbers =
function(x, ...)
{
    f = attr(x, "file") # needs to be the PDF
    f = gsub("xml$", "pdf", f)
    for(i in seq(along = x))  {
        skim(f, x[i])
        if(i < length(x)) {
            cat('next page (', x[i+1], ')', sep = '')
            v = readLines(stdin(), n = 1)
            if(v == "0" || tolower(v) == "q")
                return(NULL)
        }
    }
}
