#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinythemes)

# Define UI for application that draws a histogram
shinyUI(
  navbarPage(
    "Aplikacja",
    tabPanel("Wczytywanie danych",
             sidebarPanel(
               fileInput("dataFile", 
                         label = "Wybierz plik",
                         accept = ".xlsx",
                         buttonLabel = "Przeglądaj...")
             ),
             mainPanel(
               textOutput("dataSummary")
             )),
    tabPanel("Wykres"),
    tabPanel("Raport"),
    navbarMenu("O aplikacji",
               tabPanel("O autorze"),
               tabPanel("Kontakt"))
  )
)