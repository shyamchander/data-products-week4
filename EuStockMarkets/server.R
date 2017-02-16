#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
        
  output$euPlot <- renderPlot({
    
  graph    <- EuStockMarkets[,as.numeric(input$indices)]
  
  subset <- window(graph,start=c(input$years[1],0),end=c(input$years[2],0))

    # draw the histogram with the specified number of bins
    plot(subset,main="")
    
  })
  
  output$summary <- renderPrint({
          graph    <- EuStockMarkets[,as.numeric(input$indices)]
          
          subset <- window(graph,start=c(input$years[1],0),end=c(input$years[2],0))
          summary(subset)
          })
  
  output$range <- renderPrint({ input$years })
  
  output$indices <- renderPrint({ colnames(EuStockMarkets)[as.numeric(input$indices)]})
  
})
