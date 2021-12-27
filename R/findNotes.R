findNotes =
function(file, show = FALSE)    
{
    file = normalizePath(file)
    doc = readPDFXML(file)
    w = getNodeSet(doc, '//page[coords]')
    ans = structure(as.integer(sapply(w, xmlGetAttr, "number")), class = "PageNumbers", file = file)
    if(show)
        display(ans)

    invisible(ans) # don't print which will call display().
}

print.PageNumbers =
function(x, ...  )
  display(x, ...)



