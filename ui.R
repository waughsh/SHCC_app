library(shiny)
ui <- fluidPage(
  leafletOutput("myMap", height = 820),
  p()
)

