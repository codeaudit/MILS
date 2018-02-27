library("shiny")

shinyUI(fluidPage(
  titlePanel("Minimal Algorithmic Information Loss for Data Reduction"),
  
  sidebarLayout(
    
    wellPanel(
      textInput(inputId = "insertString",
                label = "Enter a string",
                value = "110001101010111101"),
      
      sliderInput(inputId = "nReduced",
                  label = "Number of reduced bits",
                  min = 1, max = 10, value = 10, step = 1),
      
      sliderInput(inputId = "blockSize",
                  label = "Block size",
                  min = 2, max = 12, value = 12),
      
      sliderInput(inputId = "blockOverlap",
                  label = "Block overlap",
                  min = 0, max = 11, value = 11),
      
      
      radioButtons(inputId = "alphabet",
                   label = "Alphabet size",
                   inline = TRUE,
                   choices = list("2" = 2,
                                  "4" = 4,
                                  "5" = 5,
                                  "6" = 6,
                                  "9" = 9),
                   selected = 2),
      
      
      radioButtons(inputId = "differenceType",
                   label = "BDM Difference",
                   inline = TRUE,
                   choices = list("From original string" = "orig",
                                  "From median of -1 bit reduced strings" = "seq"),
                   selected = "orig"),
      
       
      radioButtons(inputId = "reductionMethod",
                   label = "Reduction method",
                   inline = TRUE,
                   choices = list("Simultaneous" = "sim",
                                  "Sequential" = "seq"),
                   selected = "sim"),
      
      # Boton
      actionButton("evalButton", "Evaluate")
    ),
    
    mainPanel(
      
      br(),
      
      h3("Result of Evaluation"),
      
      br(),
      
      div(p(textOutput(outputId = "origStr")),
          style = "font-size:120%",
          align = "center"),
      
      div(p(textOutput(outputId = "mutateStr")),
          style = "font-size:120%",
          align = "center")
      
    )
    
  )
  
))