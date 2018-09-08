library(shiny)

shinyUI(fluidPage(
  titlePanel("Predict Eruptions from waiting time"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("sliderWaiting",
                  "Waiting Time:",
                  min = 40,
                  max = 100,
                  value = 20),
      
      checkboxInput("showmodel","Show/Hide Model", value=TRUE)
    ),
    mainPanel(
      plotOutput("plot"),
      h3("Predicted Eruptions"),
      textOutput("pred")
    )
  )
))
