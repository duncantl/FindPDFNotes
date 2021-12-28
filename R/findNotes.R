findNotes =
    #
    # not sure the show = FALSE and the display and print method make entire sense
    #  We can't just see the results in R by printing the object.
    #  so probably remove the print method.
    # and change the name show to display.

    #
    #  lwd = duncan = .5, matt = .825
    #
    
function(file, color = data.frame(c('65536,0,0', '0,0,0'), c(.5, .872)), lwd = numeric(), show = FALSE)    
{
    file = normalizePath(file)
    doc = readPDFXML(file)

    xpath = mkXPathQuery(color, lwd)

    w = getNodeSet(doc, xpath)
    ans = structure(as.integer(sapply(w, xmlGetAttr, "number")), class = "PageNumbers", file = file)
    if(show)
        display(ans)

    invisible(ans) # don't print which will call display().
}

mkXPathQuery =
    #
    # mkXPathQuery()
    # mkXPathQuery(c("red"))
    # mkXPathQuery(c("red"), .5)
    # mkXPathQuery(data.frame(c("red", "blue"), c(.872, .5)))
function(color = character(), lwd = numeric(), and = is.data.frame(color))
{
    if((missing(color) && missing(lwd)) || (length(color) == 0 && length(lwd) == 0))
        return('//page[coords]')

    force(and)  # need to force as about to potentially change defn and type of color
      #Example of lazy eval and debugging this.
    
    if(is.data.frame(color) && length(lwd) == 0) {
        lwd = color[[2]]
        color = color[[1]]
    }

    if(length(color) && length(lwd)) 
        sub = paste(sprintf("(@stroke.color = '%s' %s @lineWidth = '%s')", color, if(and) "and" else "or", lwd), collapse = " or ")
    else  if(length(color) > 0) 
        sub = paste(sprintf("@stroke.color = '%s'", color), collapse = " or ")
    else
        sub = paste(sprintf("@lineWidth = '%s'", lwd), collapse = " or ")        

    return(sprintf("//page[coords[%s]]", sub))    
}




if(FALSE)
print.PageNumbers =
function(x, ...  )
  display(x, ...)



