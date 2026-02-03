#' Compose _NatureDataCube_/_AgroDataCube_ URL
#'
#' Compose URL text string to submit requests through _NatureDataCube_/_AgroDataCube_ REST APIs.
#'
#' @param option character. Determines the type of request.
#' @param params vector or list. List of named parameters.
#' @returns A request URL text string.
#' @export

ndc_url <- function(option, params) {

  # Create the base URL
  base_url <- "https://agrodatacube.wur.nl/api/v2/rest/"
  data_options <- c("Fields"            = "fields",
                    "AHN"               = "ahn",
                    "AHN_image"         = "ahn_image",
                    "Meteo"             = "meteostations",
                    "Meteo_station"     = "meteostations/XXX",
                    "Meteo_data"        = "meteodata",
                    "Soilparams"        = "soilparams",
                    "Soiltypes"         = "soiltypes",
                    "NDVI"              = "ndvi",
                    "NDVI_image"        = "ndvi_image",
                    "Cropcodes"         = "codes/cropcodes",
                    "Soilcodes"         = "codes/soilcodes",
                    "Cropcategory"      = "codes/category",
                    "Municipalities"    = "regions/municipalities",
                    "Postalcodes"       = "regions/postalcodes",
                    "Provinces"         = "regions/provinces",
                    "KPI_Greenness"     = "datapackage/kpi/greenness",
                    "KPI_Croprotation"  = "datapackage/kpi/croprotation")

  # Add parameters
  params_nona <- lapply(na.omit(params), FUN = function(x) URLencode(x, repeated = TRUE))
  params_url <- paste(names(params_nona), params_nona, sep = "=", collapse = "&")
  url <- paste0(base_url, data_options[option], "?", params_url)
  
  return(url)
}
