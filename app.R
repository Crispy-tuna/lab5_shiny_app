#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(devtools)
devtools::install_github("rui0027/lab5group5")
library(lab5group5)

ui <- fluidPage(
    # Tittle and widgets
    pageWithSidebar(
        headerPanel("Input data"),
        sidebarPanel(
          textInput("name",label="Name",value = "Linkoping"),
          numericInput("zoom_level", label="Zoom level",value=10),
          selectInput("select", label="Choose a type of map", 
                                  choices =c("toner" , "terrain",
                                                 "watercolor"),
                                  selected = "toner")
        ),

        mainPanel(
          plotOutput("map")
        )
    )
)

server <- function(input, output) {

    output$map <- renderPlot({
      lab5group5::findmap(input$name,input$zoom_level,input$select)})
}

# Run the application 
shinyApp(ui = ui, server = server)
