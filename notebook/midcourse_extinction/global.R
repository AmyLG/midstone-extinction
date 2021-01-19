library(shiny)
library(shinydashboard)
library(tidyverse)
library(leaflet)
library(sp)
library(rgdal)

### Read the geospatial files using rgdal
ecos_data <- rgdal::readOGR("../../data/ecos_all_geo.geojson/")

ecos_species <- read.csv("../../data/ecos_end_species_countries_clean.csv")

#animal_group <- sort(unique(ecos_data$species_gr))

animal_group <- sort(unique(ecos_species$species_gr))