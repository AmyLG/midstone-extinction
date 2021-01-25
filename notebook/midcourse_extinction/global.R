### Shiny
library(shiny)
library(shinydashboard)
library(dashboardthemes)

### Plots
library(tidyverse)
library(plotly)

### Maps
library(leaflet)
library(sp)
library(rgdal)


### word cloud
library(wordcloud)
library(RColorBrewer)
library(wordcloud2)
library(tm)
library(NLP)

### Read the geospatial files using rgdal
ecos_data <- rgdal::readOGR("ecos_all_geo.geojson/")

### Read the csv file with text information (geospatial conversion lost some text)
ecos_species <- read.csv("ecos_end_species_countries_clean.csv")

### Read the plotly interactive treemap for usa 
treemap_usa <- readRDS("treemap_usa.rds")

### Read the plotly interactive treemap for countries 
treemap_country <- readRDS("treemap_country.rds")

### Word cloud cause
ecos_cause = read.csv('ecos_cause.csv')

### function for the radio button
animal_group <- sort(unique(ecos_species$species_gr))
