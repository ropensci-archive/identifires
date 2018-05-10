ct <- function(l) Filter(Negate(is.null), l)

idf_ua <- function() {
  versions <- c(
    paste0("r-curl/", utils::packageVersion("curl")),
    paste0("crul/", utils::packageVersion("crul")),
    sprintf("rOpenSci(identifires/%s)", utils::packageVersion("identifires"))
  )
  paste0(versions, collapse = " ")
}

idf_GET <- function(path, args, ...){
  cli <- crul::HttpClient$new(
    url = file.path(idf_base(), path),
    opts = list(useragent = idf_ua())
  )
  temp <- cli$get(query = args, ...)
  temp$raise_for_status()
  x <- temp$parse("UTF-8")
  return(x)
}

idf_GET_async <- function(urls, ...) {
 cc <- crul::Async$new(urls = urls)
 res <- cc$get(...)
 lapply(res, function(z) z$parse("UTF-8"))
}

idf_parse <- function(x, parse, flatten = FALSE) {
  tmp <- jsonlite::fromJSON(x, parse, flatten = flatten)
  if (parse) {
    df <- tibble::as_tibble(tmp) 
    names(df) <- tolower(names(df))
    return(df)
  } else {
    return(tmp)
  }
}

idf_base <- function() "https://identifiers.org"

space <- function(x) gsub("\\s", "%20", x)

assert_is <- function(x, y) {
  if (!is.null(x)) {
    if (!class(x) %in% y) {
      stop(deparse(substitute(x)), " must be of class ",
           paste0(y, collapse = ", "), call. = FALSE)
    }
  }
}

assert_n <- function(x, n) {
  if (!is.null(x)) {
    if (!length(x) == n) {
      stop(deparse(substitute(x)), " must be length ", n, call. = FALSE)
    }
  }
}

idf_bind <- function(x) {
  tibble::as_tibble(do.call("rbind.data.frame", x))
}
