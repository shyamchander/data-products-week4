#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("EU Stock Market Plots - 1991-1998"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
        h4("This application allows user to plot the EU Stock Market Daily end of maket trends by varying the year range and indices."),
      checkboxGroupInput("indices", label = h3("Select Stock Indices to plot"), 
                       choices = list("DAX" = 1, "SMI" = 2, "CAC" = 3,  "FTSE" = 4),
                       selected = c(1,2,3,4)),
       sliderInput("years",
                   "Select range of years to display in plot:",
                   min = 1991,
                   max = 1998,
                   value = c(1991,1998))
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("euPlot"),
       hr(),
       h4("Summary daily index value for the range and indices selected:"),
       verbatimTextOutput("summary"),
       hr(),
       h4("Stock Indices selected:"),
       textOutput("indices"),
       hr(),
       h4("Range selected:"),
       textOutput("range")
    )
  )
))
