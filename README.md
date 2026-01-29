# NatureDataCube-R

R functions to work with data from _NatureDataCube_.

_NatureDataCube_ is a platform based on [_AgroDataCube_](https://agrodatacube.wur.nl/), holding and providing access to data used in the context of project [LTER-LIFE](https://lter-life.nl/en).

## Desired functionality

- [X] [`ndc_url`](`R/ndc_url.R`): Compose URL text string for submitting data requests through the REST API (Note: for the moment, it works with almost all tests (based on examples from _AgroDataCube_'s documentation) in the [examples notebook](`tests/examples.ipynb`));

- [X] [`ndc_get`](`R/ndc_get.R`): Submit requests via REST API (Note: for the moment, it works with almost all tests (based on examples from _AgroDataCube_'s documentation) in the [examples notebook](`tests/examples.ipynb`));

- [ ] Verify and format input parameters for submitting valid requests via REST API;

  - Including generating the `geometry` parameter in WKT format from polygon(s) in different formats (e.g. from packages `sf` or `terra`).

- [ ] Format request responses to different types of R objects

  - To table (e.g. `data.frame`, `tibble`)
  
  - To spatial (vector/raster) objects (e.g. from `sf` or `terra` packages)

- [ ] Export outputs to appropriate file formats (e.g. CSV, ESRI Shapefile, GeoTIFF, COG, ZARR)

- [ ] Connect package functionality to Shiny app GUI.
