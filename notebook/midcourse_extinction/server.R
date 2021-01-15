#
# This is the server logic of a Shiny web application. 

# Define server logic required to get the picture url
shinyServer(function(input, output) {
  
  # first choice is animal group and second is the species specific to the animal group chosen
  output$species <- renderUI({
    
    animal <- ecos_data@data %>% 
      filter(species_gr == input$group) %>% 
      pull(common_nam) %>% 
      sort()

    selectInput("species",
                "Choose a species:",
                choices = animal)
                })
  
  #Define server logic required to get common, scientific, esa status and description
  
  #Define server logic required to get the picture url  
  src = "https://ecos.fws.gov/docs/species_images/doc4660.png"
  output$picture <- renderText({c('<img src="',src,'"width="300" height="400">')})
  
  #Define server logic required to get the tabs
  
  # Define server logic required to get the map
  output$map <- renderLeaflet({leaflet(ecos_data[ecos_data$common_nam == animal,]) %>%  addTiles() %>%
    addPolygons(color = "purple", weight = 1, smoothFactor = 0.5, opacity = 1.0, fillOpacity = 0.2, fillColor = "purple")
})
})
