################################## #
### Projet d'analyse VTC Heetch ## #
################################## #

# load packages ----
library(dplyr)
library(sf) #données géométriques
library(leaflet) #visualisation
library(lubridate) #work with times
library(mapsf) #as leaflet but static
library(tidyr) #gerer les convestion de table: long to matric_carre

# load data  ----
casaBound <- st_read("data/casabound.geojson") #des poinrts qui forment une
# un object spatial "simple features"
osmFeatures <- readRDS("data/osmfeatures.Rds") 
# load hetchpoints (a simple feature)
heetch_points <- readRDS("data/heetchmarchcrop.Rds") #too much data
# load neigbors
casa_neib <- st_read("data/casaneib.geojson")
head(casa_neib)

# project all data ----
proj_crs <- 26191 #code de la proj nord maroc
casaBound_proj = st_transform(casaBound, crs=proj_crs)
heetch_points_proj = st_transform(heetch_points, crs=proj_crs)
casa_neib_proj = st_transform(heetch_points, crs=proj_crs)
rm(proj_crs)
