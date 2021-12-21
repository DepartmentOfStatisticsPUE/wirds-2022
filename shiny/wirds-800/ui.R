#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)
library(shinythemes)
# Define UI for application that draws a histogram
shinyUI(
  ## fluidPage
  navbarPage("Aplikacja",
    fluid = TRUE,
    theme = shinytheme("united"),
    tabPanel("Faithful", 
        # Application title
        titlePanel("Aplikacja testowa -- WIRDS 2021/22"),
        # Sidebar with a slider input for number of bins
        sidebarLayout(
            sidebarPanel(
                sliderInput("bins",
                            "Number of bins:",
                            min = 1,
                            max = 50,
                            value = 30)
            ),
            # Show a plot of the generated distribution
            mainPanel(
              tabsetPanel(type = "tabs",
                          ## histogram
                          tabPanel("Wykres", plotOutput("distPlot")),
                          ## zaprezentowane dane
                          tabPanel("Dane", dataTableOutput("datasetTable")),
                          ## wykres rozrzutu (interaktywny)
                          tabPanel("Korelacja", plotlyOutput("scatterPlot")),
                          ## model regresji liniowej
                          tabPanel("Regresja", verbatimTextOutput("regression")))
                
            )
        )
    ), 
tabPanel("O aplikacji")

))
