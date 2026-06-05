#' Date(s) in RCF3339 format
#'
#' Convert one or more dates to the RCF3339 format.
#'
#' @import lubridate
#' @param x either a single date or a vector of two dates.
#' @returns character. Either one date or a range of start and end dates in RCF3339 format. (Note: the interval can be open on one of the two sides.)
#' @export

# Packages
library(lubridate)

# Primary function
as_rcf3339 <- function(x) {
  format(as_datetime(x), "%Y-%m-%dT%H:%M:%SZ")
}

# Wrapper
ndc_trange <- function(x) {
  if(all(is.na(x)) || length(x) < 1 || length(x) > 2) {
    NA
  } else if (length(x) == 1) {
    as_rcf3339(x)
  } else if (length(x) == 2 && is.na(x[1])) {
    paste(c("..", as_rcf3339(x[2])), collapse = "/")
  } else if (length(x) == 2 && is.na(x[2])) {
    paste(c(as_rcf3339(x[1]), ".."), collapse = "/")
  } else {
    paste(lapply(sort(x), FUN = as_rcf3339), collapse = "/")
  }
}
