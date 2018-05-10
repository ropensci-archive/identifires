#' Validate identifiers
#' 
#' validates the given prefix:identifier scheme
#' 
#' @export
#' @param ids (character) one or more identifiers. required. 
#' when more than 1 passed, we use async http requests
#' @template all
#' @details if no parameters passed, gets all resources
#' @return When `ids` passed, data.frame of the form :
#' - prefix
#' - identifier
#' - url
#' @examples \dontrun{
#' idf_validate(ids = "MIR:00100675")
#' idf_validate(ids = c("MIR:00100675", "MIR:00100005"))
#' }
idf_validate <- function(ids, ...) {
  assert_is(ids, "character")

  path <- "rest/identifiers/validate"
  uri <- file.path(path, ids)
  if (length(uri) == 1) {
    idf_parse(idf_GET(uri, list(), ...), TRUE)
  } else {
    res <- idf_GET_async(file.path(idf_base(), uri))
    idf_bind(lapply(res, idf_parse, parse = TRUE))
  }
}
