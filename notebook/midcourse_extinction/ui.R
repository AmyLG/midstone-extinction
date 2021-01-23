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
          radioButtons(
                      "group",
                      "Choose a group:",
                      choices = animal_group),
          uiOutput("species")
        ),
        
        dashboardBody(
          
          
          ### Set the dashboard theme
          shinyDashboardThemes(theme = "grey_dark"),
          
          ### Set the table panel
          tabsetPanel(
            tabPanel("Home",
                     #Home page
                     fluidRow(
                       
                       box(width = NULL,
                           infoBox("Species", 648, icon = icon("paw"), color = "aqua", fill = TRUE),
                           infoBox("Countries", 80, icon = icon("map"), color = "yellow", fill = TRUE),
                           infoBox("ESA status", 4, icon = icon("exclamation-triangle"), color = "olive", fill = TRUE)
                          ),
                       box(width = NULL,

                           "The goal of this project is to have specific information of species that are in danger of extinction, where they are localized and why they are endangered." 
                           ,br(), br(),
                           "The data selected is from ECOS(Environmental Council of the States) Api data."
                           ,br(), br(),
                           "The ESA (Endangered Species Act) species status was simplified in 4 categories: species of concern, threatened, endangered and extinct."
                       ),
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
              }
              group{color:orange}
             '))
              ), 

            # Box for name and basic information
          
            box(title = textOutput("name"), solidHeader = TRUE, status = "primary",
              tags$head(tags$style("#name{color: black;
                                 font-size: 18px;
                                 font-weight: bold;
                                 }"
                                  )
                      ),
              textOutput("scientif_name"),
              tags$head(tags$style("#scientif_name{color: white;
                                 font-size: 14px;
                                 font-style: italic;
                                 #background:#0B173B;
                                 }"
                                  )
                        ),
              textOutput("country"),
              tags$head(tags$style("#country{color: white;
                                 font-size: 16px;
                                 font-style: bold;
                                 #background:#0B173B;
                                 }"
              )
              ),
              textOutput("esa_status"),
              tags$head(tags$style("#esa_status{color: #ff4500;
                                 font-size: 16px;
                                 font-style: bold;
                                 #background:#0B173B;
                                 }"
                                  )
                        ),
              textOutput("description"),
              tags$head(tags$style("#description{color: white;
                                 font-size: 14px;
                                 #background:#0B173B;
                                 }"
                                   )
                        ),

              ),
            
            # Box for species picture 
          
            box(background = "light-blue",
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
            
            box(background = "light-blue",
                leafletOutput("map"))
           
        )

          ), #TabPanel2
        
        ### Panel for Treemap
        tabPanel("Treemaps",
            
                 #Main page
                 fluidRow(
                   
                       box(title = "Species in danger per state in the United States", solidHeader = TRUE, background = "black",
                           width = NULL,
                         plotlyOutput("USA_treemap")
                       ),
                   
                   
                          box(title = "Species in danger per country", solidHeader = TRUE, background = "black",
                              width = NULL,
                            plotlyOutput("country_treemap"),
                
                          )
                   
                 )
        ), #TabPanel3
        
        ### Panel for Cloud word
        tabPanel("Cloud words",
                 #Main page
                 fluidRow(
                   box(title = "Possible reasons concerning the endangered species", solidHeader = TRUE, background = "black",
                     width = NULL,
                       wordcloud2Output("cause_words")
                   )
                 )
        ) #TabPanel4

        ) #tabsetPanel

        ) #dashboardBody
       
  ) #dashboardPage
) #dashboardPage
