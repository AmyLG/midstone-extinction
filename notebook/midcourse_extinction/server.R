#
# This is the server logic of a Shiny web application. 

# Define server logic required to get the picture url
shinyServer(function(input, output) {
  src = "https://ecos.fws.gov/docs/species_images/doc4660.png"
  output$picture <- renderText({c('<img src="',src,'"width="300" height="400">')})
  
# Define server logic required to get the picture url
output$map <- renderLeaflet({leaflet(ecos_data[ecos_data$common_nam == "Akekee",]) %>%  addTiles() %>%
  addPolygons(color = "purple", weight = 1, smoothFactor = 0.5, opacity = 1.0, fillOpacity = 0.2, fillColor = "purple")
})
})
