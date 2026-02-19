#' Compose _NatureDataCube_/_AgroDataCube_ URL
#'
#' Compose URL text string to submit requests through _NatureDataCube_/_AgroDataCube_ REST APIs.
#'
#' @param option character. Determines the type of request.
#' @param params vector or list. List of named parameters.
#' @param base_url character. Base URL for the REST API.
#' @export

ndc_url <- function(option, params, base_url = "https://agrodatacube.wur.nl/api/v2/rest/") {

  # Map options
  data_options <- c("Health_check"      = "lifeprobe",
                    "Fields"            = "fields",
                    "AHN"               = "ahn",
                    "AHN_image"         = "ahn_image",
                    "Meteo_stations"    = "meteostations",
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

  # Format parameters
  if (!missing(params)) {
    params_nona <- lapply(na.omit(params),
                          FUN = function(x) URLencode(x, repeated = TRUE))
    if ((option == "Meteo_stations") && ("meteostation" %in% names(params_nona))) {
      params_ms <- params_nona["meteostation"]
      params_nona <- params_nona[-which(names(params_nona) == "meteostation")]
      ms_url <- paste0("/", as.character(params_ms))
    } else {
      ms_url <- ""
    }
    params_url <- paste(names(params_nona), params_nona, sep = "=", collapse = "&")
  } else {
    params_url <- ""
  }
  
  # Compose URL
  url <- paste0(base_url, data_options[option])
  if (option != "Health_check") {
    url <- paste0(url, ms_url, "?", params_url)
  }
  return(url)
}
