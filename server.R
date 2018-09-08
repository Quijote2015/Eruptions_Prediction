library(shiny)

shinyServer(function(input, output){
model <- lm(eruptions ~ waiting, data=faithful)

modelpred <- reactive({
  waitingInput <- input$sliderWaiting
  predict(model, newdata=data.frame(waiting=waitingInput))
})

output$plot <- renderPlot({
  waitingInput <- input$sliderWaiting
  
  plot(faithful$waiting, faithful$eruptions, xlab="Time",
       ylab="Eruptions", bty="n", pch=16,
       xlim=c(40,100), ylim=c(0,5.5))
  abline(model, col="red", lwd=2)
  legend(80,2,"Model Prediction",pch=16, col="red", bty="n", cex=1.2)
  points(waitingInput, modelpred(), col="blue", pch=16,cex=2)
  })

output$pred <- renderText({
  modelpred()
  })
})