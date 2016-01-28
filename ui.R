library(shiny)
ui <- fluidPage(
  leafletOutput("myMap", height = 820),
  absolutePanel(top=10,right=10,
                sliderInput("range", "Months", min(STI_2$visit.month_n),max(STI_2$visit.month_n),value=range(STI_2$visit.month_n),step=1),
                sliderInput("range_2", "Years", min(STI_2$visit.year),max(STI_2$visit.year),value=range(STI_2$visit.year),step=1)),
  HTML('<style type="text/css">
     .control-label { background-color: #FFFFFF; }
     </style>'),
  fluidRow(
    column(width = 10, "This is a ALPHA VERSION APPLICATION, all data is curretly housed in a secure server at the Emerging Pathogens Institute")
  ),
  p()
)

