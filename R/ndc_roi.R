#' Spatial region of interest
#'
#' Import and transform spatial region of interest.
#'
#' @import sf
#' @param roi character, numeric or sf. Region of interest. Can be either: (i) a character value for one of the projects from the Data Registry, (ii) a numeric vector with coordinates representing a bounding box, or (iii) an sf object with a (multi)polygon representing a custom region of interest.
#' @returns A request response list.
#' @export

library(sf)

ndc_roi <- function(roi = NULL) {

  if (missing(roi) || is.null(roi)) {
    r <- NULL
  } else {
    # Check object type
    if ("character" %in% class(roi)) {
      r <- st_read(roi, quiet = TRUE)
    } else if ("numeric" %in% class(roi)) {
      r <- st_bbox(roi)
    } else {
      r <- roi
    }
  
    # Extract geometry
    if (any(c("sf", "sfc") %in% class(r))) {
      r <- st_geometry(r)
    }

    # Check projection
    if (st_crs(r) != st_crs(4326)) {
      r <- st_transform(r, 4326)
    }
  }

  r
}

# TODO: Add the possibility to input one of several special character values for pre-defined RoIs
