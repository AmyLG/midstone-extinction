library(shiny)
library(shinydashboard)
library(tidyverse)
library(leaflet)
library(sp)
library(rgdal)

### Read the geospatial files using rgdal
ecos_data <- rgdal::readOGR("../../data/ecos_us_ca_geo.geojson/")

animal_group <- sort(unique(ecos_data$species_gr))