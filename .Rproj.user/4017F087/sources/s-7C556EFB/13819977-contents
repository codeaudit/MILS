library(shiny)
source("simultaneousAttackOnStrings.R")

server <- function(input, output) {
  
  output$showStr <- renderText({
    
    input$evalButton
    isolate({
      print(paste0("The string is: ", input$insertString))
      
    })
    
  })
  
}