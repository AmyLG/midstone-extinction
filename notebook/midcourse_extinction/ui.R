#
# This is the user-interface definition of a Shiny web application.

# Define UI for application that draws a histogram
shinyUI(
    dashboardPage(
        dashboardHeader(title = "Extinction is Forever", titleWidth = 500),
        
        dashboardSidebar("sidebar"),
        
        dashboardBody("body")

        
  ) 
)
