#' Download STAC assets originating in WCS servers
#'
#' Wrapper to download data from STAC endpoints that originated in WCS servers.
#'
#' @import rstac
#' @import httr
#' @param items doc_item. Items list resulting from `items_fetch()`.
#' @param out_dir character. Output directory path.
#' @param overwrite boolean. If `TRUE`, overwrite file.
#' @returns A request response list.
#' @export

library(rstac)
library(httr)

assets_download_wcs <- function(items, out_dir = tempdir(), overwrite = TRUE) {
  
  # Get asset URLs, item IDs, and output paths
  wcs_urls <- assets_url(items, asset_names = "wcs")
  item_ids <- vapply(items$features, function(f) f$id, character(1))
  dest <- file.path(out_dir, paste0(item_ids, ".tif"))

  # Download files
  response <- GET(wcs_urls[1], write_disk(dest[1], overwrite = TRUE))
  if (length(wcs_urls) > 1) {
    for (i in 2:length(wcs_urls)) {
      new_response <- GET(wcs_urls[i], write_disk(dest[i], overwrite = TRUE))
      response <- list(response, new_response)
    }
  }
  return(response)
}
