library(shiny)
source("simultaneousAttackOnStrings.R")

server <- function(input, output, session) {
  
  observeEvent(input$blockSize, {
    updateSliderInput(session,
                      "blockOverlap",
                      max = input$blockSize - 1)
  })
  
  observeEvent(input$insertString, {
    updateSliderInput(session,
                      "nReduced",
                      max = nchar(input$insertString) - 2)
  })
  
  output$origStr <- renderText({
    
    input$evalButton
    isolate({
      print(paste0("Original string = ", input$insertString))
      
    })
    
  })
  
  output$mutateStr <- renderText({
    
    input$evalButton
    isolate({
      paste0("Reduced string (minimal algorithmic loss) = ", 
                   simultaneousAttackOnString(input$insertString, 
                                              input$blockSize, 
                                              input$blockSize - input$blockOverlap, 
                                              input$alphabet, input$nReduced, 
                                              FALSE)
      )
      
    })
    
  })
  
}