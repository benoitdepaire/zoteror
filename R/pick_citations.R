library(httr)
library(purrr)

#' A Function to pick citations from Zotero
#'
#' This function allows you to select citations from your zotero library to add the appropriate keys to your markdown document
#' @return Adds reference keys in your markdown document
#' @examples
#' pick_citations()
#'
#' @export
pick_citations <- function(){
  r <- httr::GET("http://localhost:23119/better-bibtex/cayw")
  if(httr::status_code(r)==200){
    temp <- httr::content(r)[1]

    temp <- unlist(strsplit(temp, ","))
    temp <- purrr::map_chr(temp, ~paste0("@",.))
    temp <- paste(temp, collapse=", ")

    rstudioapi::insertText(temp)
  }
}
