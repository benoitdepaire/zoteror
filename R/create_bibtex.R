#' A Function to create a bibtex file
#'
#' This function allows you to create a bibtex file for the citations used in your markdown document.
#' @param
#' @keywords
#' @export Creates a bibtex file in the current directory
#' @examples
#' create_bibtex()
create_bibtex <- function(){
  jsonstring <- '{"method" :"bibtex", "params": [ ["van_der_aalst_business_2013", "van_aalst_auditing_2010"], {"translator": "betterbibtex"} ] }'

  temp <- httr::POST(url = 'http://localhost:23119/better-bibtex/schomd',
               encode="json",
               body = jsonstring,
               content_type("application/x-www-form-urlencoded"),
               verbose())

  write(httr::content(temp)$result,file = "references.bibtex")
}
