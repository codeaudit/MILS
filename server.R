library("shiny")
source("simultaneousAttackOnStrings.R")

shinyServer(function(input, output, session) {
  
  #observeEvent(input$blockSize, {
  #  updateSliderInput(session,
  #                    "blockOverlap",
  #                    max = input$blockSize - 1)
  #})
  
  observeEvent(input$insertString, {
    updateSliderInput(session,
                      "nReduced",
                      max = nchar(input$insertString) - 2)
  })
  
  output$origStr <- renderText({
    
    input$evalButton
    isolate({
      paste0("Original string = ", input$insertString)
      
    })
    
  })
  
  output$mutateStr <- renderText({
    
    input$evalButton
    isolate({
      paste0("Reduced string with minimal algorithmic loss = ", 
                   simultaneousAttackOnString(input$insertString, 
                                              blockSize=12, 
                                              offset = 12, 
                                              input$alphabet, input$nReduced, 
                                              FALSE)
      )
      
    })
    
  })
  
})