# NatureDataCube-R

This package provides R-based interface to *NatureDataCube*, both programmatic (i.e. R functions and wrappers) and graphical (through an R-Shiny app).

The idea of the *NatureDataCube* is to offer an accessible way for researchers/ecologists to retrieve relevant data.

*NatureDataCube* is a platform based on [*AgroDataCube*](https://agrodatacube.wur.nl/), holding and providing access to data used in the context of project [LTER-LIFE](https://lter-life.nl/en).

## Main R functions

### Via the *NatureDataCube* STAC API (see [`examples_ndc.ipynb`](%60tests/examples_ndc.ipynb%60) and [`examples_stac.ipynb`](%60tests/examples_stac.ipynb%60))

- [`ndc_datasets`](%60R/ndc_datasets.R%60): List all datasets (optionally constrained by query parameters) in NatureDataCube.
- [`ndc_search`](%60R/ndc_search.R%60): Return results from a custom STAC query (optionally fetching the resulting STAC Items)
- [`ndc_count`](%60R/ndc_count.R%60): Obtain a number of items available in NatureDataCube datasets (optionally constrained by query parameters).
- [`ndc_roi`](%60R/ndc_roi.R%60): Import and transform spatial region of interest.
- [`ndc_trange`](%60R/ndc_trange.R%60): Convert one or more dates to the RCF3339 format.
- [`assets_download_wcs`](%60R/assets_download_wcs.R%60): Workaround for downloading STAC Assets coming from WCS servers.

### Via the *AgroDataCube* REST API (see [`examples_adc.ipynb`](%60tests/examples_adc.ipynb%60))

- [`adc_url`](%60R/adc_url.R%60): Compose URL text string for submitting data requests through the REST API.
- [`adc_get`](%60R/adc_get.R%60): Submit requests via REST API.

### Via the *GroenMonitor* WCS GeoServer (see [`examples_gm.ipynb`](%60tests/examples_gm.ipynb%60))

- [`gm_url`](%60R/gm_url.R%60): Compose URL text string for submitting data requests through the *GroenMonitor* WCS GeoServer.
- [`gm_get`](%60R/gm_get.R%60): Submit requests to the *GroenMonitor* WCS GeoServer.

### To be implemented

- [ ] Implement wrapper `ndc_get` for downloading data from the *NatureDataCube* STAC endpoint;
- [ ] Add (advanced) STAC filtering (e.g. post-fetching filtering, CQL2);
- [ ] Add a way to easily list available date ranges within items matched with search parameters;
- [ ] Add function(s) to deal with weather (point) data;
- [ ] Add functions for post-processing (e.g. cropping acquired gridded data to RoI);
- [ ] Connect package functionality to the [Shiny App GUI](https://github.com/LTER-LIFE/NatureDataCube-Shiny);
- [ ] Harmonize functionality across the different data sources, ando also towards using the returned data within Digital Twins platforms (e.g. *NaaVRE*);
- [ ] Generally improve all functions.

## Shiny app

### Opening the Shiny app

To use the Shiny app and continue working with the retrieved data in R, the app must be launched in a specific way so that the output is stored in an R object.

Steps:

- Navigate to the Shiny app [directory](https://github.com/LTER-LIFE/NatureDataCube-Shiny/tree/main/R/naturedatacube_app)
- Open `app.R` in RStudio (or another R environment).
- Install and load all required R packages.
- Set your working directory to the root folder of the repository: `setwd("path/to/NatureDataCube-Shiny"`)
- Launch the Shiny app from the R console: `data_nc <- runApp("R/naturedatacube_app/app.R"`)

Launching the app in this way ensures that the output generated through the Shiny interface is returned and stored in the R variable data_nc. This allows you to continue working with the retrieved data in R after closing the app. To retrieve data from the Nature Data Cube, an API token is required. Make sure your token is available in your R session before requesting data.

### Generate an API token

To generate your free personal API token to retrieve data you can go to [Register API tokens](https://agrodatacube.wur.nl/api/register.jsp).

### Running with Docker or Podman

The app can also be run as a container, which handles all package dependencies automatically.

**Setup:**

Copy `.env.example` to `.env` and fill in your API token:

```         
NDC_TOKEN=your_token_here
SHINY_APP_BASE_URL=/naturedatacube
```

**Run:**

``` bash
# Docker
docker compose up --build

# Podman
podman compose up --build
```

The app will be available at `http://localhost:3838/naturedatacube`.

### Description

The user can open a Shiny interface which lets them select an area (management area, research site or they cand draw their own area of interest) to retrieve data for. Below is a description of all the files that are in this repository.

``` markdown
NatureDataCube-R/
├─ data/
└─ R/
   ├─ naturedatacube_app/
   └─ retrieval_functions/
```