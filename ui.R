library(shiny)
ui <- fluidPage(
  leafletOutput("myMap", height = 820),
  absolutePanel(top=10,right=10,
                sliderInput("range", "Months", min(STI_2$visit.month_n),max(STI_2$visit.month_n),value=range(STI_2$visit.month_n),step=1)),
  fluidRow(
    column(width = 10, "This is a Alpha Version of this application, all data is curretly housed in a secure server at the Emerging Pathogens Institute")
  ),
  p()
)
