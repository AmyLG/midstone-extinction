#
# This is the server logic of a Shiny web application. 

# Define server logic required to get the picture url
shinyServer(function(input, output) {
  
  # first choice is animal group and second is the species specific to the animal group chosen
  output$species <- renderUI({
    
    #animal <- ecos_data@data %>% 
      #filter(species_gr == input$group) %>% 
      #pull(common_nam) %>% 
      #sort()
    animal <- ecos_species %>% 
      filter(species_group == input$group) %>% 
      pull(common_name) %>% 
      sort()

    selectInput("species",
                "Choose a species:",
                choices = animal)
                })
  
  #Define server logic required to get common, scientific, esa status and description
  output$name <- renderText(ecos_species%>% 
                               filter(common_name == input$species) %>%         
                               pull(common_name))
  output$scientif_name <- renderText(ecos_species %>% 
                              filter(common_name == input$species) %>%         
                              pull(scientific_name))
  output$country <- renderText(ecos_species %>% 
                              filter(common_name == input$species) %>%         
                              pull(country))
  output$esa_status <- renderText(ecos_species %>% 
                              filter(common_name == input$species) %>%         
                              pull(esa_status))
  output$description <- renderText(ecos_species %>% 
                              filter(common_name == input$species) %>%         
                              pull(description))
  
  #Define server logic required to get the picture url  
  src <- reactive({(ecos_species %>% 
    filter(common_name == input$species) %>% 
    pull(image_url_full))})
    
  output$picture <- renderText({c('<img src="',src(),'"width="400">')})
  
  
  #Define server logic required to get the tabs

  output$cause <- renderText(ecos_species %>% 
                                filter(common_name == input$species) %>%         
                                pull(cause))
  
  output$home <- renderText(ecos_species %>% 
                               filter(common_name == input$species) %>%         
                               pull(home_range))
  
  output$habitat <- renderText(ecos_species %>% 
                              filter(common_name == input$species) %>%         
                              pull(habitat_requirements))
  
  output$diet <- renderText(ecos_species %>% 
                              filter(common_name == input$species) %>%         
                              pull(food))
  
 output$reproduction <- renderText(ecos_species %>% 
                              filter(common_name == input$species) %>%         
                              pull(reproduction))
  
 
  # Define server logic required to get the map
  output$map <- renderLeaflet({leaflet(ecos_data[ecos_data$common_nam == input$species,]) %>%  addTiles() %>%
    addPolygons(color = "purple", weight = 1, smoothFactor = 0.5, opacity = 1.0, fillOpacity = 0.2, fillColor = "purple")
})
  

  # Define server logic required to get the treemap USA
  output$USA_treemap <- renderPlotly({
    treemap_usa
  })
  # Define server logic required to get the treemap countries
  output$country_treemap <- renderPlotly({
    treemap_country
  })
  
  # Define server logic required to get the word_cloud
  output$cause_words <- renderWordcloud2({
  #Create a vector containing only the text
  text <- ecos_cause$cause
  # Create a corpus  
  docs <- Corpus(VectorSource(text))
  # Clean my text
  docs <- docs %>%
  tm_map(removeNumbers) %>%
  tm_map(removePunctuation) %>%
  tm_map(stripWhitespace)
  docs <- tm_map(docs, content_transformer(tolower))
  docs <- tm_map(docs, removeWords, stopwords("english"))
  #Create a document-term-matrix
  dtm <- TermDocumentMatrix(docs) 
  matrix <- as.matrix(dtm) 
  words <- sort(rowSums(matrix),decreasing=TRUE) 
  df <- data.frame(word = names(words),freq=words)
  #Plot
  wordcloud2(data=df, size=1.6, color='random-dark')
  })
  
})