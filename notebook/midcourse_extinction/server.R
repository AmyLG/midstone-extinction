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
  output$scientificname <- renderText(ecos_data@data %>% 
                              filter(common_nam == input$species) %>% 
                              pull(scientific))
  
  #Define server logic required to get the picture url  
  src <- reactive({(ecos_data@data %>% 
    filter(common_nam == input$species) %>% 
    pull(image_url_))})
    
  output$picture <- renderText({c('<img src="',src(),'"width="400">')})
  
  
  #Define server logic required to get the tabs

  output$cause <- renderText(ecos_data@data %>% 
                      filter(common_nam == input$species) %>%         
                      pull(cause))
  
  output$home <- renderText(ecos_data@data %>% 
                               filter(common_nam == input$species) %>%         
                               pull(home_range))
  
  output$habitat <- renderText(ecos_data@data %>% 
                              filter(common_nam == input$species) %>%         
                              pull(habitat_re))
  
  output$diet <- renderText(ecos_data@data %>% 
                              filter(common_nam == input$species) %>%         
                              pull(food))
  
 output$reproduction <- renderText(ecos_data@data %>% 
                              filter(common_nam == input$species) %>%         
                              pull(reproducti))
  
 
  # Define server logic required to get the map
  output$map <- renderLeaflet({leaflet(ecos_data[ecos_data$common_nam == input$species,]) %>%  addTiles() %>%
    addPolygons(color = "purple", weight = 1, smoothFactor = 0.5, opacity = 1.0, fillOpacity = 0.2, fillColor = "purple")
})
})
