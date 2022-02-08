
# Make a Map (Option 1)


#I start of by installing relevant packages 

install.packages("leaflet")
#I have trouble installing the html.widget package, so to make it possible to see in browser i do it manually

#As well as libraries

library(leaflet) 
library(tidyverse)
library(readr)

#Then i create a map of The Blue Mountain area in West of Sydney showing basic topography and relief
#Also adding a minimap for further interaction

leaflet() %>%
  addTiles() %>%
  addProviderTiles("Esri.WorldImagery", 
                   options = providerTileOptions(opacity=0.5)) %>% 
  setView(lng = 149.7360685, lat = -33.3493207, zoom = 10) %>%
  addMiniMap()


#Next step is to load in the table of points

places <- read_csv("~/Desktop/Spatial analytics/W5 - leaflet/data/RCFeature2018.csv")
View(RCFeature2018)
glimpse(places)

#Here i will be plotting in the points on the map and add FeatureID, FeatureType and Describtion to each point
#I will also be adding the option of clustering the markers, as some of the places are very close to each other
BlueMountainMap <- leaflet() %>% 
  addTiles() %>% 
  addMarkers(lng = places$Longitude, 
             lat = places$Latitude,
             popup = paste("ID:", places$FeatureID, "<br>",
              "Type:", places$FeatureType, "<br>",
              "Describtion:", places$Description, "<br>"),
             clusterOptions = markerClusterOptions())
BlueMountainMap

#Now the interactive map can be used in browser, where it is possible to zoom in and out on the different points, as well as click on each point to read its information





