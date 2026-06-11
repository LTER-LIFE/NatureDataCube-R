<<<<<<< HEAD
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
=======
# NatureDataCube Shiny interface (dummy version for the Spring connection)

This repository contains the R code for a Shiny interface of the NatureDataCube.
The idea of the NatureDataCube is that it offers an accessible way for researchers/ecologists to retrieve relevant data. It is a dummy version and it will be used for the Spring Connection. The Shiny interface was made as an example of what the interface of the NatureDataCube could look like and to gather feedback from researchers.

This interface is built upon the work from Minke Mulder (NIOO-KNAW) in October - December 2025.

### Opening the Shiny app
To use the Shiny app and continue working with the retrieved data in R, the app must be launched in a specific way so that the output is stored in an R object.

Steps:

- Navigate to the Shiny app [directory](https://github.com/LTER-LIFE/NatureDataCube-Shiny/tree/main/R/naturedatacube_app)
- Open `app.R` in RStudio (or another R environment).
- Install and load all required R packages.
- Set your working directory to the root folder of the repository: `setwd("path/to/NatureDataCube-Shiny"`)
- Launch the Shiny app from the R console: `data_nc <- runApp("R/naturedatacube_app/app.R"`)

Launching the app in this way ensures that the output generated through the Shiny interface is returned and stored in the R variable data_nc. This allows you to continue working with the retrieved data in R after closing the app. To retrieve data from the Nature Data Cube, an API token is required.  Make sure your token is available in your R session before requesting data.

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
```bash
# Docker
docker compose up --build

# Podman
podman compose up --build
```

The app will be available at `http://localhost:3838/naturedatacube`.

### Description

The user can open a Shiny interface which lets them select an area (management area, research site or they cand draw their own area of interest) to retrieve data for. Below is a description of all the files that are in this repository.

#### Shiny app

Folder: [R/naturedatacube_app](https://github.com/LTER-LIFE/NatureDataCube-Shiny/tree/main/R/naturedatacube_app)

This folder contains the R code for the Shiny interface. 

Folder: [retrieval_functions](https://github.com/LTER-LIFE/NatureDataCube-Shiny/tree/main/R/retrieval_functions) taken from [NatureDataCube-R](https://github.com/LTER-LIFE/NatureDataCube-R)

This folder contains the retrieval code for constructing the urls.

#### Data

Folder: [data](https://github.com/LTER-LIFE/NatureDataCube-Shiny/tree/main/data)

This folder contains the data of the available study areas. 
>>>>>>> NatureDataCube-Shiny/main
