library(shiny)
library(magrittr)
library(leaflet)
library(bslib)

waterfowlObs <-  read.csv2("waterfowl_1.csv",
                          sep = ",")
waterfowlObs$latitude <- as.numeric(waterfowlObs$y)
waterfowlObs$longitude <- as.numeric(waterfowlObs$x)
# activeSites <- activeSites[!is.na(activeSites$latitude),]


colorPal <- colorFactor(
  palette = rainbow(length(unique(waterfowlObs$Species))),
  levels = unique(waterfowlObs$Species)
)
