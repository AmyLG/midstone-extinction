### Shiny
library(shiny)
library(shinydashboard)

### Plots
library(tidyverse)

### Maps
library(leaflet)
library(sp)
library(rgdal)

### Treemap
library(treemapify)

### word cloud
library(wordcloud)
library(RColorBrewer)

### Read the geospatial files using rgdal
ecos_data <- rgdal::readOGR("../../data/ecos_all_geo.geojson/")

### Read the csv file with text information (geospatial conversion lost some text)
ecos_species <- read.csv("../../data/ecos_end_species_countries_clean.csv")

### Read the csv file for countries treemap
ecos_treemap <- read.csv("../../data/ecos_treemap_count.csv")

### Read the csv file for US states treemap
ecos_treemap_usa <- read.csv("../../data/ecos_treemap_usa_count.csv")

### function for the radio button
animal_group <- sort(unique(ecos_species$species_gr))