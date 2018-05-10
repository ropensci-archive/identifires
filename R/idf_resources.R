#' Resources
#' 
#' retrieves the list of all available resources
#'
#' @export
#' @param ids (character) one or more identifiers. optional. 
#' when more than 1 passed, we use async http requests
#' @template all
#' @details if no parameters passed, gets all resources
#' @return When `ids` passed, data.frame of the form :
#' - id
#' - accessurl
#' - info
#' - institution
#' - location
#' - official
#' - resourceprefix
#' - localid
#' - resourceurl
#' 
#' When `ids` NOT passed, data.frame of the form :
#' - urlPrefix
#' - urlSuffix
#' - urlResource
#' - info
#' - institution
#' - location
#' - example
#' - official
#' - obsolete
#' - frameDeny
#' - convertPrefix
#' - resourcePrefix
#' - _links
#' 
#' @examples \dontrun{
#' x <- idf_resources()
#' idf_resources(ids = "MIR:00100675")
#' idf_resources(ids = c("MIR:00100675", "MIR:00100005"))
#' }
idf_resources <- function(ids = NULL, ...) {
  assert_is(ids, "character")

  path <- "rest/resources"
  uri <- if (is.null(ids)) path else file.path(path, ids)
  if (is.null(ids)) {
    tmp <- idf_parse(idf_GET(path, list(), ...), TRUE, TRUE)
    tibble::as_tibble(tmp$`_embedded`$resources)
  } else {
    if (length(uri) == 1) {
      idf_parse(idf_GET(uri, list(), ...), TRUE)
    } else {
      res <- idf_GET_async(file.path(idf_base(), uri))
      idf_bind(lapply(res, idf_parse, parse = TRUE))
    }
  }
}
