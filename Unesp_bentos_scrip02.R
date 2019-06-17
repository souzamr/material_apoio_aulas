# Plotagem de pontos de coleta 
# baseado em: https://www.r-graph-gallery.com

# 10 pontos de coleta aleatórios próximos a Juréia

# Install packages
# install.packages(c("shiny", "leaflet"))

# Load libraries
library(shiny)
library(leaflet)

# Make data with several positions
data_red=data.frame(LONG=-47.080808+rnorm(5, 0.001, 0.1), LAT=-24.434066+rnorm(5, 0.001, 0.1), PLACE=paste("Red_place_",seq(1,5)))
data_blue=data.frame(LONG=-47.080808+rnorm(5, 0.001, 0.1), LAT=-24.434066+rnorm(5, 0.001, 0.1), PLACE=paste("Blue_place_",seq(1,5)))

# Initialize the leaflet map:
leaflet() %>% 
  setView(lng=-47, lat=-24, zoom=8 ) %>%
  
  # Add two tiles
  addProviderTiles("Esri.WorldImagery", group="background 1") %>%
  addTiles(options = providerTileOptions(noWrap = TRUE), group="background 2") %>%
  
  # Add 2 marker groups
  addCircleMarkers(data=data_red, lng=~LONG , lat=~LAT, radius=8 , color="black",  fillColor="red", stroke = TRUE, fillOpacity = 0.8, group="Red") %>%
  addCircleMarkers(data=data_blue, lng=~LONG , lat=~LAT, radius=8 , color="black",  fillColor="blue", stroke = TRUE, fillOpacity = 0.8, group="Blue") %>%
  
  # Add the control widget
  addLayersControl(overlayGroups = c("Red","Blue") , baseGroups = c("background 1","background 2"), options = layersControlOptions(collapsed = FALSE))
