display =
    #
    # Generic that is for displaying something but not in R
    # Could be a PDF file in a PDF viewer/reader, something (e.g. an SVG/JavaScript-based graphic) in a Web browser.
    # Could be a sequence of things such as pages or multiple plots in a single Web page.
    #
function(x, ...)
    UseMethod("display")

display.PageNumbers =
    # display the pages one after the other in the PDF viewer.    
function(x, ...)
{
    f = attr(x, "file") # needs to be the PDF
    f = gsub("xml$", "pdf", f)
    message("q, Q or 0 will end the paging")
    for(i in seq(along = x))  {
        showPage(p, x[i])
        if(i < length(x)) {
            cat('next page (', x[i+1], ')', sep = '')
            v = readLines(stdin(), n = 1)
            if(v == "0" || tolower(v) == "q")
                return(NULL)
        }
    }
}
