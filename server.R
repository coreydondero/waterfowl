


shinyServer(
  function(input, output, session) {
    
    GetURL <- function(service, host = "basemap.nationalmap.gov") {
      sprintf("https://%s/arcgis/services/%s/MapServer/WmsServer", host, service)
    }
    
    attribution <-
      paste0("<a href='https://www.usgs.gov/'>",
             "U.S. Geological Survey</a> | ",
             "<a href='https://www.usgs.gov/laws/policies_notices.html'>",
             "Policies</a>")
    
    opt = WMSTileOptions(format = "image/png", transparent = TRUE)
    
    output$map <- 
      renderLeaflet({
        leaflet(waterfowlObs) %>%
          addProviderTiles("Esri.WorldTerrain") %>% 
          addWMSTiles(GetURL("USGSHydroCached"),
                      attribution = attribution,
                     # group = "Hydrography",
                      options = opt,
                      layers = "0")  %>%
          setView(lng = -116.3, lat = 43.661218, zoom = 15)
      })
    
    filteredData <- reactive({
      if (is.null(input$selectedSpecies))
        {
          waterfowlObs[0,]
        }
      else
        {
          waterfowlObs[waterfowlObs$Species %in% input$selectedSpecies,]
        }
        
    })
    
    observe({
      if (nrow(filteredData()))
      {
      leafletProxy("map", data = filteredData()) %>%
        clearMarkers() %>%
        addCircleMarkers(~longitude, ~latitude,
                         # popup = ~as.character(How.Many),
                          label = ~as.character(Species),
                          color = ~colorPal(Species)
        )
      }
      else
      {
        leafletProxy("map", data = filteredData()) %>%
          clearMarkers()
      }
  
    })
    
  })

