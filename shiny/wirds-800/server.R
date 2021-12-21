#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(plotly)
library(texreg)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$distPlot <- renderPlot({

        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white')

    })

    output$datasetTable <- renderDataTable({
      return(faithful)
    })
    
    output$scatterPlot <- renderPlotly({
      
      wykres <- ggplot(data = faithful, aes(x = waiting, y = eruptions)) + 
        geom_point(shape = 2) +
        theme_bw() + 
        labs(x = "Waiting", y = "Eruptions")
      
      ggplotly(wykres)
      
    })
    
    output$regression <- renderPrint({
      model <- lm(eruptions ~ waiting, data = faithful)
      screenreg(model)
    })
})
