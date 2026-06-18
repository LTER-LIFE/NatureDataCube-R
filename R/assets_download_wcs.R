#' Download STAC assets originating in WCS servers
#'
#' Wrapper to download data from STAC endpoints that originated in WCS servers.
#'
#' @import rstac
#' @import httr
#' @param items doc_item. Items list resulting from `items_fetch()`.
#' @param output_dir character. Output directory path.
#' @param output_ext character. Output file extension.
#' @param overwrite boolean. If `TRUE`, overwrite file.
#' @returns A request response list.
#' @export

library(rstac)
library(httr)

assets_download_wcs <- function(items, asset_names = "wcs",
                                output_dir = tempdir(), output_ext = ".tif",
                                overwrite = TRUE) {
  
  # Get asset URLs, item IDs, and output paths
  wcs_urls <- assets_url(items, asset_names = asset_names)
  item_ids <- vapply(items$features, function(f) f$id, character(1))
  dest <- file.path(output_dir, paste0(item_ids, output_ext))

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
