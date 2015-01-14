## File: ui.R
## Desc: This is the ui of my Coursera class project shiny app
## Copyright: (c) 2014, Jason D. Miller

library(shiny)

shinyUI(
  fluidPage(
  # Application title
  titlePanel("Error in Answer Predictor"),
  
  
  sidebarLayout(
    sidebarPanel(
      h4("Describe Your SO Question:"),

      hr(),
        hr(),
        numericInput("bron_badges", 
                     label = h6("Numer of Bronze Badges"), 
                     value = 1),
        numericInput("silv_badges", 
                     label = h6("Numer of Silver Badges"), 
                     value = 1),
        numericInput("gold_badges", 
                     label = h6("Numer of Gold Badges"), 
                     value = 1),
        numericInput("reputation", 
                     label = h6("Numer of Reputation Points"), 
                     value = 1),
        numericInput("views", 
                     label = h6("Numer of Views"), 
                     value = 1),
        numericInput("votes", 
                     label = h6("Numer of Votes"), 
                     value = 1)

    ),  #ends sidebarPanel
    
# mainPanel ---------------------------------------------------------------
    # Main Panel for displaying results
    mainPanel(
      tabsetPanel(
        tabPanel("Results", h2("Based on your input, I predict that you fall into
                               the following category:"),h2(textOutput("results")),
                               "where",p(), h3("1 means that you will get an answer"),
                              p(), "and" , p(), h3("0 means that you will not.")),
        tabPanel("User Data", tableOutput("table"))
      )
    ) # ends main panel
  )
    ))


