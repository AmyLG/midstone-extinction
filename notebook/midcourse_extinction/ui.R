#
# This is the user-interface definition of a Shiny web application.

# Define UI for application that draws a histogram
#Valid colors: red, yellow, aqua, blue, light-blue, green, navy, teal, olive, lime, orange, fuchsia, purple, maroon, black


shinyUI(
    dashboardPage(#skin = "teal",
      
        dashboardHeader(
          title = "Extinction is Forever", titleWidth = 300),
        
        dashboardSidebar(
          selectInput("group",
                      "Choose a group:",
                      choices = animal_group),
          selectInput("species",
                      "Choose a species:",
                      choices = animal)
        ),
        
        dashboardBody(
          fluidRow(
            box(
              title = "Common name", width = 4, solidHeader = TRUE, status = "primary", background = "navy",
              "Scientific name", "esa status", "description"
              ),
            
            box(background = "yellow", htmlOutput("picture")),
            
          fluidRow(
            
            tabBox(
              
              # The id lets us use input$tabset1 on the server to find the current tab
              id = "ecos_data", height = "250px",
              tabPanel("cause", "ecos_data$cause"),
              tabPanel("home range", "home_range"),
              tabPanel("habitat", "habitat_re"),
              tabPanel("diet", "food"),
              tabPanel("reproduction", "reproducti")
            ),
            box(background = "purple", leafletOutput("map"))
          )  

          )
        )

        
  ) 
)
