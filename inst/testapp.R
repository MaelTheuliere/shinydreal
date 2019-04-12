pkgload::load_all()
library(shiny)
rm(list = ls())
ui <- function(request){
  dr_fluidPage(
    h2("plop"),
    tagList(
      
    )
  )
}

server <- function(input, output, session){
  observeEvent( input$go , {
    update_dr_progress(
      session, 
      "gauche", 
      75
    )
  })
}

shinyApp(ui, server)

