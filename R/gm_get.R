#' Get data from _GroenMonitor_
#'
#' Wrapper to get data from the _GroenMonitor_ WCS server.
#'
#' @import httr
#' @param url character. Request URL.
#' @param option character. Determines the type of request.
#' @param params vector or list. List of named parameters.
#' @returns A request response list.
#' @export

library(httr)

gm_get <- function(url, option = "NDVI", params,
                   out_path = paste(getwd(), tmpfile(), sep = "/")) {

  # Compose request URL
  if (missing(url) && !missing(option) && !missing(params)) {
    request_url <- gm_url(option = option, params = params)
  } else {
    request_url <- url
  }

  # Download file
  response <- GET(request_url, write_disk(out_path, overwrite = TRUE))

  return(response)
}

# Example
# curl -L -o Nestkast_Bennekom_ndvi_20251225.tif "https://data.groenmonitor.nl/geoserver/wcs?service=WCS&version=2.0.1&request=GetCoverage&coverageId=groenmonitor__ndvi_20251225&subset=E(684613,685907)&subset=N(5763913,5764822)&format=image/tiff"
# 
# myurl <- gm_url(option = "NDVI",
#                 params = c(date = "20251225",
#                            xmin = 684613,
#                            xmax = 685907,
#                            ymin = 5763913,
#                            ymax = 5764822,
#                            format = "tiff"))
# gm_get(url = myurl,
#        out_path = "Nestkast_Bennekom_ndvi_20251225.tif")
