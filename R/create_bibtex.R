#' A Function to create a bibtex file
#'
#' This function allows you to create a bibtex file for the citations used in your markdown document.
#' @return Creates a bibtex file in the current directory
#' @examples
#' create_bibtex()
#'
#' @export
create_bibtex <- function(){

  #retrieve content of current doc
  temp <- rstudioapi::getActiveDocumentContext()
  path <- temp$path
  temp <- temp$contents
  temp <- paste(temp, collapse = " ")

  #Extract all keys (words starting with @)
  temp <- gsubfn::strapplyc(temp, '@\\w+', simplify=T)
  #remove @
  temp <- gsub("@","", temp, fixed = T)
  #add quotes
  temp <- shQuote(temp)
  #create jsonstring
  temp <- paste(temp, collapse=", ")
  jsonstring <- paste0('{"method" :"bibtex", "params": [ [',
                       temp,
                       '], {"translator": "betterbibtex"} ] }')

  temp <- httr::POST(url = 'http://localhost:23119/better-bibtex/schomd',
               encode="json",
               body = jsonstring,
               httr::content_type("application/x-www-form-urlencoded"))


  path <- gsub('/[^/]*$', "",path)
  write(httr::content(temp)$result,file = paste(path,"bibliography.bib",sep = "/"))
}
