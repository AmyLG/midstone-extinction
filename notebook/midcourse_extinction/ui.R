#
# This is the user-interface definition of a Shiny web application.

# Define UI for application that draws a histogram
#Valid colors: red, yellow, aqua, blue, light-blue, green, navy, teal, olive, lime, orange, fuchsia, purple, maroon, black


shinyUI(
    dashboardPage(#skin = "teal",
      
        dashboardHeader(
          title = "Extinction is Forever", titleWidth = 300),
        
        dashboardSidebar(
          radioButtons("group",
                      "Choose a group:",
                      choices = animal_group),
          uiOutput("species")
        ),
        
        dashboardBody(
          fluidRow(
            box(
              title = "name", width = 4, solidHeader = TRUE, status = "primary", background = "navy",
              "scientificname", "esa status", "description"
              ),
            
            #box(background = "yellow", htmlOutput("picture")),
            box(background = "yellow", uiOutput("picture")),
            
          fluidRow(
            
            #box(
              #tabPanel(tableOutput('cause')),
              
            tabBox(
              
              # The id lets us use input$tab on the server to find the current tab
      
              tabPanel("cause",tableOutput("cause")),
              tabPanel("home", tableOutput("home_range")),
              tabPanel("habitat", tableOutput("habitat_re")),
              tabPanel("diet", tableOutput("food")),
              tabPanel("reproduction", tableOutput("reproducti"))
            ),
            
            #map
            box(background = "purple", leafletOutput("map"))
          )  

          )
        )

        
  ) 
)
