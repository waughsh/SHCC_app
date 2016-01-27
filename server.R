library(shiny)
server <- function(input, output, session) {
  filteredData <- reactive({
    STI_2[STI_2$visit.year >= input$range_2[1] & STI_2$visit.year <= input$range_2[2] & STI_2$visit.month_n >= input$range[1] & STI_2$visit.month_n <= input$range[2],]
  })
  output$myMap <- renderLeaflet(
    leaflet(STI_2) %>% addTiles('http://{s}.basemaps.cartocdn.com/dark_all/{z}/{x}/{y}.png', 
                                attribution='Map tiles by <a href="http://stamen.com">Stamen Design</a>, <a href="http://creativecommons.org/licenses/by/3.0">CC BY 3.0</a> &mdash; Map data &copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>')  %>%
      setView(-82.352, 29.645, zoom = 13) 
  )
  observe({
    leafletProxy("myMap", data = filteredData()) %>%
      clearShapes() %>%
      clearMarkerClusters() %>%
      addCircles(weight = 3, radius=15, 
                 color="#ffa500", stroke = TRUE, fillOpacity = 0.8,group="STI-Points") %>%
      addMarkers(clusterOptions = markerClusterOptions(),icon=NULL, group="STI-Clusters") %>%
      addLayersControl(
        overlayGroups = c("STI-Points", "STI-Clusters"), options = layersControlOptions(collapsed = FALSE), position=c("bottomright"))
  })
  observe({
    proxy <- leafletProxy("myMap", data = STI_2)
  })
}
