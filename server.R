## File: server.R
## Desc: This is the ui of my Coursera class project shiny app
## Copyright: (c) 2014, Jason D. Miller


# Libraries
require(data.table)
require(randomForest)
require(ROCR)
require(shiny)
require(shinyapps)
require(stringr)

# Run shinyServer function
shinyServer(function(input, output) {
  x      <- readRDS("x.rds")
  rf     <- readRDS("rf.rds")
  #perf   <- readRDS("perf.rds")
  userdf <- x[1,]
  

  # Reactively update the prediction dataset!
  values <- reactiveValues()
  values$df <- userdf
  newEntry <- observe({
      values$df$bron_badges <- input$bron_badges
      values$df$silv_badges <- input$silv_badges
      values$df$gold_badges <- input$gold_badges
      values$df$reputation  <- input$reputation
      values$df$views       <- input$views
      values$df$votes       <- input$votes
  })
  output$table <- renderTable({data.frame(values$df)})
  userdata     <- reactive({data.frame(values$df)})

  output$results <- renderText({
                      {  ds1 <- values$df #userdata()
                         x   <- x[,sort(names(x))] 
                         ds1 <- ds1[,sort(names(ds1))] 
                         ds1 <- colnames(x)
                         predict(rf, newdata = ds1)
                      }
                      })
})  