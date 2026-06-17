#' Load study sites
#'
#' Load polygons for all study sites available through LTER-LIFE.
#'
#' @import sf
#' @param layer character. Pre-defined study site. If `NULL`, return all available study sites. Otherwise, return the boundaries for the pre-defined study site with that name.
#' @returns Either a character vector with layer names, or an sf object with a (multi)polygon representing the boundaries for a pre-defined study site.
#' @export

library(sf)

ndc_sites <- function(layer = NULL) {
  gpkg <- system.file("extdata/study_sites.gpkg", package = "NatureDataCubeR")
  layers <- tryCatch(st_layers(gpkg)$name, error = function(e) NULL)
  all_layers <- NULL
  if (!is.null(layer) && !is.null(layers)) {
    all_layers <- set_names(lapply(layers, function(x) st_read(gpkg, layer = x, quiet = TRUE)),
                            #purrr::map(layers, ~ sf::st_read(gpkg, layer = .x, quiet = TRUE)),
                            layers)
    return(all_layers[[layer]])
  } else {
    return(layers)
  }
}
