#' Get data from _AgroDataCube_
#'
#' Wrapper to get data from _AgroDataCube_ through their REST API.
#'
#' @import httr
#' @param url character. Request URL.
#' @param option character. Determines the type of request.
#' @param params vector or list. List of named parameters.
#' @param token character. API token.
#' @param server character. Server to connect to, either the main or test _AgroDataCube_ server.
#' @param download boolean. If `TRUE`, download file.
#' @returns A request response list.
#' @export

library(httr)

adc_get <- function(url, option, params, token, server = "adct",
                    download = FALSE, out_path = tempfile()) {

  # Servers
  server_code <- tolower(server)
  if (server_code %in% c("adc", "agrodatacube", "agro data cube")) {
    base_url <- "https://agrodatacube.wur.nl/api/v2/rest/"
  } else if (server_code %in% c("test", "adct", "agrodatacube-test", "agro data cube test")) {
    base_url <- "https://agrodatacube-test.containers.wur.nl/api/v2/rest/"
  }

  # Compose request URL
  if (missing(url) && !missing(option) && !missing(params)) {
    request_url <- adc_url(option = option, params = params, base_url = base_url)
  } else {
    request_url <- url
  }
    
  # Compose request headers
  request_headers <- c("Accept" = "application/json;charset=utf-8",
                       "token"  = token)

  # Submit request
  if (download) {
      response <- content(VERB("GET", url = request_url, add_headers(request_headers),
                               write_disk(out_path, overwrite = TRUE)))
  } else {
      response <- content(VERB("GET", url = request_url, add_headers(request_headers)))
  }
  return(response)
}
