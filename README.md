# NatureDataCube-R

R functions to work with data from _NatureDataCube_.

_NatureDataCube_ is a platform based on [_AgroDataCube_](https://agrodatacube.wur.nl/), holding and providing access to data used in the context of project [LTER-LIFE](https://lter-life.nl/en).

## Implemented functions

### To access data through the _NatureDataCube_ STAC API

- [X] [`ndc_datasets`](`R/ndc_datasets.R`): List all datasets (optionally constrained by query parameters) in NatureDataCube.

- [X] [`ndc_search`](`R/ndc_search.R`): Return results from a custom STAC query (optionally fetching the resulting STAC Items)

- [X] [`ndc_count`](`R/ndc_count.R`): Obtain a number of items available in NatureDataCube datasets (optionally constrained by query parameters).

- [X] [`ndc_roi`](`R/ndc_roi.R`): Import and transform spatial region of interest.

- [X] [`ndc_trange`](`R/ndc_trange.R`): Convert one or more dates to the RCF3339 format.

- [X] [`assets_download_wcs`](`R/assets_download_wcs.R`): Workaround for downloading STAC Assets coming from WCS servers.

- [X] Tests/examples for _NatureDataCube_ are provided in the [`examples_ndc` notebook](`tests/examples_ndc.ipynb`) and [`examples_stac` notebook](`tests/examples_stac.ipynb`).

### To access data through the _AgroDataCube_ REST API

- [X] [`adc_url`](`R/adc_url.R`): Compose URL text string for submitting data requests through the REST API;

- [X] [`adc_get`](`R/adc_get.R`): Submit requests via REST API;

- [X] Tests based on examples from _AgroDataCube_'s documentation are provided in the [`examples_adc` notebook](`tests/examples_adc.ipynb`).

### To access data through the _GroenMonitor_ WCS GeoServer

- [X] [`gm_url`](`R/gm_url.R`): Compose URL text string for submitting data requests through the _GroenMonitor_ WCS GeoServer;

- [X] [`gm_get`](`R/gm_get.R`): Submit requests to the _GroenMonitor_ WCS GeoServer;

- [X] Tests/examples for _GroenMonitor_ are provided in the [`examples_gm` notebook](`tests/examples_gm.ipynb`).

## ToDo

- [ ] Implement wrapper `ndc_get` for downloading data from the _NatureDataCube_ STAC endpoint;

- [ ] Add (advanced) STAC filtering (e.g. post-fetching filtering, CQL2);

- [ ] Add a way to easily list available date ranges within items matched with search parameters;

- [ ] Add function(s) to deal with weather (point) data;

- [ ] Add functions for post-processing (e.g. cropping acquired gridded data to RoI);

- [ ] Connect package functionality to the [Shiny App GUI](https://github.com/LTER-LIFE/NatureDataCube-Shiny);

- [ ] Harmonize functionality across the different data sources, ando also towards using the returned data within Digital Twins platforms (e.g. _NaaVRE_);

- [ ] Generally improve all functions.
