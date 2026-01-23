# NatureDataCube-R

R functions to work with data from _NatureDataCube_.

_NatureDataCube_ is a platform based on [_AgroDataCube_](https://agrodatacube.wur.nl/), holding and providing access to data used in the context of project [LTER-LIFE](https://lter-life.nl/en).

## Desired functionality

- [X] Compose URL text string for submitting data requests through the REST API;
  
  - For the moment, function `ndc_url` (`R/ndc_url.R`) works with almost all tests (based on examples from _AgroDataCube_'s documentation) in `tests/ndc_url.ipynb`.

- [ ] Wrapper to facilitate submitting requests via REST API;

- [ ] Wrapper to verify and format parameters for valid submission of request to the REST API;

- [ ] Connect package functionality to Shiny app GUI.

