# NatureDataCube-R

This package provides R-based interface to *NatureDataCube*, both programmatic (i.e. R functions and wrappers) and graphical (through an R-Shiny app).

The idea of the *NatureDataCube* is to offer an accessible way for researchers/ecologists to retrieve relevant data.

*NatureDataCube* is a platform based on [*AgroDataCube*](https://agrodatacube.wur.nl/), holding and providing access to data used in the context of project [LTER-LIFE](https://lter-life.nl/en).

## Main R functions

### Via the *NatureDataCube* STAC API (see [`examples_ndc.ipynb`]("tests/examples_ndc.ipynb") and [`examples_stac.ipynb`]("tests/examples_stac.ipynb"))

- [`ndc_datasets`]("R/ndc_datasets.R"): List all datasets (optionally constrained by query parameters) in NatureDataCube.
- [`ndc_search`]("R/ndc_search.R"): Return results from a custom STAC query
- [`ndc_get`]("R/ndc_get.R"): Fetch or download data through a custom STAC query
- [`ndc_count`]("R/ndc_count.R"): Obtain a number of items available in NatureDataCube datasets (optionally constrained by query parameters).
- [`ndc_roi`]("R/ndc_roi.R"): Import and transform spatial region of interest.
- [`ndc_trange`]("R/ndc_trange.R"): Convert one or more dates to the RCF3339 format.
- [`assets_download_wcs`]("R/assets_download_wcs.R"): Workaround for downloading STAC Assets coming from WCS servers.

### Via the *AgroDataCube* REST API (see [`examples_adc.ipynb`]("tests/examples_adc.ipynb"))

- [`adc_url`]("R/adc_url.R"): Compose URL text string for submitting data requests through the REST API.
- [`adc_get`]("R/adc_get.R"): Submit requests via REST API.

### Via the *GroenMonitor* WCS GeoServer (see [`examples_gm.ipynb`]("tests/examples_gm.ipynb"))

- [`gm_url`]("R/gm_url.R"): Compose URL text string for submitting data requests through the *GroenMonitor* WCS GeoServer.
- [`gm_get`]("R/gm_get.R"): Submit requests to the *GroenMonitor* WCS GeoServer.

### To be implemented

- Add (advanced) STAC filtering (e.g. post-fetching filtering, CQL2);
- Add a way to easily list available date ranges within items matched with search parameters;
- Add function(s) to deal with weather (point) data;
- Add functions for post-processing (e.g. cropping acquired gridded data to RoI);
- Connect package functionality to the [Shiny App GUI](https://github.com/LTER-LIFE/NatureDataCube-Shiny);
- Harmonize functionality across the different data sources, ando also towards using the returned data within Digital Twins platforms (e.g. *NaaVRE*);
- Generally improve all functions.

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