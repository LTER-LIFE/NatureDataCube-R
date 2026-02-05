# NatureDataCube-R

R functions to work with data from _NatureDataCube_.

_NatureDataCube_ is a platform based on [_AgroDataCube_](https://agrodatacube.wur.nl/), holding and providing access to data used in the context of project [LTER-LIFE](https://lter-life.nl/en).

## Implemented functions

### Through _NatureDataCube_/_AgroDataCube_ REST API

- [X] [`ndc_url`](`R/ndc_url.R`): Compose URL text string for submitting data requests through the REST API;

- [X] [`ndc_get`](`R/ndc_get.R`): Submit requests via REST API;

- [X] Tests based on examples from _AgroDataCube_'s documentation in the [examples notebook](`tests/examples.ipynb`).

### Through _GroenMonitor_ WCS GeoServer

- [X] [`gm_url`](`R/gm_url.R`): Compose URL text string for submitting data requests through the _GroenMonitor_ WCS GeoServer;

- [X] [`gm_get`](`R/gm_get.R`): Submit requests to the _GroenMonitor_ WCS GeoServer.

## In progress

- [ ] Verify and format input parameters for submitting valid data requests (e.g. by generating WKT from a custom shapefile or extent in simple text or R spatial object from packages such as `sf` or `terra`).

- [ ] Format request responses to different types of R objects (e.g. tables in `data.frame` or `dplyr::tibble` formats, spatial object from packages such as `sf` or `terra`)

- [ ] Export outputs to appropriate file formats (e.g. CSV, ESRI Shapefile, GeoTIFF, COG, ZARR)

- [ ] Connect package functionality to the [Shiny App GUI](https://github.com/LTER-LIFE/NatureDataCube-Shiny) (see [demo for NAEM 2026](https://github.com/LTER-LIFE/NatureDataCube-Shiny-NAEM)).

## Future work

- [ ] Functions to access data through STAC.
