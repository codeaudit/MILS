library("shiny")

ui <- fluidPage(
  
  sidebarLayout(
    
    tabsetPanel(
      
      # Primer tab
      tabPanel("Tab name",
               
               wellPanel(
                 textInput(inputId = "insertString",
                           label = "String to be evaluated",
                           value = "10101010101010101"),
                 # Boton
                 actionButton("evalButton", "Evaluate")
               )
      )
      
    ),
    
    mainPanel(
      textOutput(outputId = "showStr")
      
    )
    
  )
  
)