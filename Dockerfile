# Use a base image with R and Shiny
FROM rocker/shiny:latest

# Install system libraries needed by some R packages
RUN apt-get update && apt-get install -y \
    libcurl4-openssl-dev \
    libxml2-dev \
    libssl-dev \
    libgeos-dev \
    libgdal-dev \
    libproj-dev \
    libudunits2-dev \
    && rm -rf /var/lib/apt/lists/*

# Install required R packages (leaflet.extras from GitHub — not on CRAN for R 4.5+).
# DESCRIPTION has no Imports field, so the package's dependencies are installed
# explicitly here rather than resolved by R CMD INSTALL.
RUN R -e "install.packages(c( \
    'shiny', 'leaflet', 'sf', 'dplyr', 'purrr', \
    'stringr', 'httr', 'geojsonsf', 'jsonlite', 'zip', 'here', 'terra', \
    'lubridate', 'tools', 'tibble', 'shinyjs', 'rstac', 'remotes' \
), repos='https://packagemanager.posit.co/cran/__linux__/noble/latest')" && \
    R -e "remotes::install_github('bhaskarvk/leaflet.extras')"

# Install the NatureDataCubeR package itself. This puts the Shiny app
# (inst/shiny/naturedatacube_app) and bundled data (inst/extdata) on the
# package's installed path, so library(NatureDataCubeR) and
# system.file(...) resolve at runtime.
COPY . /tmp/NatureDataCubeR
RUN R CMD INSTALL --no-multiarch --with-keep.source /tmp/NatureDataCubeR \
    && rm -rf /tmp/NatureDataCubeR

# Expose the port Shiny uses
EXPOSE 3838

# Launch the app via the package's own launcher, which locates the app dir
# with system.file(). SHINY_APP_BASE_URL (from .env) sets the proxy path.
CMD ["R", "-e", "NatureDataCubeR::ndc_shiny(host='0.0.0.0', port=3838)"]
