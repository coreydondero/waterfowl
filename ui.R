

fluidPage(#theme = bs_theme(version = 5, bootswatch = "minty"),
          fluidRow(
            tags$style(type = "text/css", "#map {height: calc(100vh - 70px) !important;}"),
            #headerPanel("PIT Tag Interrogation Sites"),
            # sidebar
            column(
              # style
              width = 2,
              # inputs
              checkboxGroupInput("selectedSpecies"
                                 , "Species"
                                 , choices = unique(waterfowlObs$Species)
                                 , selected = "Mallard"
                                 )
              ),
            # main
            column(
              # outputs
              leafletOutput("map"),
              width = 10)
            )
)