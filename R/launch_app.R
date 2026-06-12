launch_app <- function(...) {
  app_dir <- system.file("shiny/naturedatacube_app", package = "NatureDataCubeR")
  if (!nzchar(app_dir)) {
    stop(
      "Could not find the Shiny app directory. ",
      "Try re-installing the package with `devtools::install()`.",
      call. = FALSE
    )
  }
  shiny::runApp(app_dir, ...)
}
