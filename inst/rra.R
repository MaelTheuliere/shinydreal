pkgload::load_all()
library(shiny)
rm(list = ls())


ui <- function(request){
  dr_fluidPage(
    h2("plop"),
    tagList(
      dr_selectInput("plop", "pouet", letters)
    )
  )
}

server <- function(input, output, session){
  
  observe({
    print(input$plop)
  })
}

shinyApp(ui, server)
