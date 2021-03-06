library("shiny")
library("shinythemes")

orangeSlider <- "
.irs-bar,
.irs-bar-edge,
.irs-single,
.irs-grid-pol {
  background: #f63;
  border-color: #f63;
}"

shinyUI(fluidPage(
  theme = shinytheme("united"),
  tags$style(orangeSlider),
  
  sidebarLayout(
    
    wellPanel(
      textInput(inputId = "insertString",
                label = "Enter a string",
                value = "110001101010111101"),
      
      sliderInput(inputId = "nReduced",
                  label = "Number of reduced bits",
                  min = 1, max = 10, value = 10, step = 1),
      
      #sliderInput(inputId = "blockSize",
      #            label = "Block size",
      #            min = 2, max = 12, value = 12),
      
      #sliderInput(inputId = "blockOverlap",
      #            label = "Block overlap",
      #            min = 0, max = 11, value = 11),
      
      
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
                   label = "Element removal",
                   inline = TRUE,
                   choices = list("From absolute neutral" = "orig",
                                  "From closest to median" = "seq"),
                   selected = "orig"),
      
      #,
      
       
      #radioButtons(inputId = "reductionMethod",
      #             label = "Reduction method",
      #             inline = TRUE,
      #             choices = list("Simultaneous" = "sim",
      #                            "Sequential" = "seq"),
      #             selected = "sim"),
      
    
      actionButton("evalButton", "Evaluate", 
                   style = "color: #fff; 
                            background-color: #f63; 
                            border-color: #f63")),
    
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