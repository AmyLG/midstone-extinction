#
# This is the user-interface definition of a Shiny web application.

# Define UI for application that draws a histogram
#Valid colors: red, yellow, aqua, blue, light-blue, green, navy, teal, olive, lime, orange, fuchsia, purple, maroon, black
#teal html code: #00c7c7

shinyUI(
    dashboardPage(

        dashboardHeader(
          title = "Extinction is Forever", titleWidth = 300),
                     
        dashboardSidebar(
          radioButtons("group",
                      "Choose a group:",
                      choices = animal_group),
          uiOutput("species")
        ),
        
        dashboardBody(
          tabsetPanel(
            tabPanel("Home",
                     #Home page
                     fluidRow(
                       box(width = NULL,
                           "This is a test text"
                          )
                       )
                     ), #TabPanel1
            
          tabPanel("Species information",  
            fluidRow(
              tags$head(
              tags$style(HTML('
              .main-header .logo {
              #font-family: "Georgia", Times, "Times New Roman", serif;
              font-size: 24px;
              font-weight: bold;
              }
              .skin-blue .main-header .logo {
              color: white;
              background-color: #1EB9BC;
              group{background-color:orange} 
             }
             '))
            ), 
            
            # Box for name and basic information
          
            box(title = textOutput("name"), solidHeader = TRUE, background = "navy", status = "primary",
              tags$head(tags$style("#name{color: white;
                                 font-size: 18px;
                                 font-weight: bold;
                                 }"
                                  )
                      ),
              textOutput("scientif_name"),
              tags$head(tags$style("#scientif_name{color: white;
                                 font-size: 14px;
                                 font-style: italic;
                                 background:#0B173B;
                                 }"
                                  )
                        ),
              textOutput("country"),
              tags$head(tags$style("#country{color: white;
                                 font-size: 16px;
                                 font-style: bold;
                                 background:#0B173B;
                                 }"
              )
              ),
              textOutput("esa_status"),
              tags$head(tags$style("#esa_status{color: #ff4500;
                                 font-size: 16px;
                                 font-style: bold;
                                 background:#0B173B;
                                 }"
                                  )
                        ),
              textOutput("description"),
              tags$head(tags$style("#description{color: white;
                                 font-size: 14px;
                                 background:#0B173B;
                                 }"
                                   )
                        ),

              ),
            
            # Box for species picture 
          
            box(background = "yellow",
                uiOutput("picture")
                ),
            
            # Box for animal information table 
            
            tabBox(
              tabPanel("cause",tableOutput("cause")),
              tabPanel("home", tableOutput("home")),
              tabPanel("habitat", tableOutput("habitat")),
              tabPanel("diet", tableOutput("diet")),
              tabPanel("reproduction", tableOutput("reproduction"))
            ),
            
            # Box for leaflet map polygon
            
            box(background = "purple",
                leafletOutput("map"))
           
        )

          ), #TabPanel2
        
        ### Panel for Treemap
        tabPanel("Treemaps",
                 #Main page
                 fluidRow(
                   
                       box(
                         width = NULL,
                         plotOutput("country_treemap")
                       ),
                   
                   
                          box(
                            width = NULL,
                            plotOutput("USA_treemap")
                          )
                   
                 )
        ), #TabPanel3
        
        ### Panel for Cloud word
        tabPanel("Cloud word",
                 #Main page
                 fluidRow(
                   box(width = NULL,
                       plotOutput("cause_words")
                   )
                 )
        ) #TabPanel4

        ) #tabsetPanel

        ) #dashboardBody
       
  ) #dashboardPage
) #dashboardPage
