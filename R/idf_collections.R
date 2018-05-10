#' Collections
#' 
#' retrieves a list of all available collections
#'
#' @export
#' @param ids (character) one or more identifiers. optional. 
#' @param names (character) one or more names. optional
#' @param providers (character) a provider prefix. optional
#' @template all
#' @details If no parameters passed, you get all collections.
#' 
#' When more than 1 string passed to `ids`, `names`, or `providers`, 
#' we use async http requests
#' @return data.frame or list, depending on what's passed to the function
#' @examples \dontrun{
#' (x <- idf_collections())
#' 
#' idf_collections(ids = "MIR:00000008")
#' ids <- c("MIR:00000249", "MIR:00000307", "MIR:00000308", "MIR:00000312", 
#'   "MIR:00000313", "MIR:00000315")
#' idf_collections(ids = ids)
#' idf_collections(names = "pdb")
#' idf_collections(names = "pdb")
#' idf_collections(providers = "pdb")
#' idf_collections(providers = "pdb")
#' }
idf_collections <- function(ids = NULL, names = NULL, providers = NULL, ...) {
  assert_is(ids, "character")
  assert_is(names, "character")
  assert_is(providers, "character")

  if (length(ct(list(ids, names, providers))) > 1) {
    stop("can only pass in one of 'ids', 'names', or 'providers'")
  }

  path <- "rest/collections"
  if (!is.null(ids)) uri <- file.path(path, ids)
  if (!is.null(names)) uri <- file.path(path, "name", names)
  if (!is.null(providers)) uri <- file.path(path, "provider", providers)

  if (is.null(ids) && is.null(names) && is.null(providers)) {
    idf_parse(idf_GET(path, list(), ...), TRUE)
  } else {
    if (length(uri) == 1) {
      idf_parse(idf_GET(uri, list(), ...), is.null(ids))
    } else {
      res <- idf_GET_async(file.path(idf_base(), uri))
      tmp <- lapply(res, idf_parse, parse = is.null(ids))
      if (is.null(ids)) idf_bind(tmp) else tmp
    }
  }
}
