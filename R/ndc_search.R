#' Search datasets in NatureDataCube
#'
#' Return results from a custom STAC query (optionally fetching the resulting STAC Items)
#'
#' @import rstac
#' @import httr
#' @param collection character. Collection ID.
#' @param roi character, numeric or sf. Region of interest. Can be either: (i) a character value for one of the projects from the Data Registry, (ii) a numeric vector with coordinates representing a bounding box, or (iii) an sf object with a (multi)polygon representing a custom region of interest.
#' @param trange character. Temporal range.
#' @param limit integer. Maximum number of STAC Items to return.
#' @param token character. API token.
#' @returns A request response list.
#' @export

library(rstac)
library(httr)

ndc_search <- function(collection, roi = NULL, trange = NULL, limit = 100,
                       token = Sys.getenv("NDC_TOKEN")) {
  
  headers <- add_headers("Authorization" = paste0("Bearer ", token))
  endpoint <- stac("https://ndc-test.containers.wur.nl/api/")
  
  ## Initiate search by collection
  query <- stac_search(endpoint, collections = collection, limit = limit)

  ## Spatial constraints
  if (!missing(roi) || !is.null(roi)) {
    query <- stac_search(query, intersects = ndc_roi(roi), limit = limit)
  }

  ## Temporal constraints
  if (!missing(trange)) {
    query <- stac_search(query, datetime = trange, limit = limit)
  }

  ## Submit request
  post_request(query, headers)
}
