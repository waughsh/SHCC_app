library(shiny)
ui <- fluidPage(
  leafletOutput("myMap", height = 820),
  absolutePanel(top=10,right=10,
                sliderInput("range", "Months", min(STI_2$visit.month_n),max(STI_2$visit.month_n),value=range(STI_2$visit.month_n),step=1), checkboxGroupInput("year", "Year:",
                                                                                                                                                              c("2005" = "5",
                                                                                                                                                                "2006" = "6",
                                                                                                                                                                "2007" = "7","2008" = "8","2009" = "9","2010" = "10","2011" = "11","2012" = "12","2013" = "13","2014" = "14","2015"= "15"))),
  p()
)