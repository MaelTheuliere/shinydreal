library(shiny)
ui <- function(request){
  dr_fluidPage(
    h2("plop"),
    tagList(
      dr_sm_actionButton("a", "Un bouton")
    )
  )
}

server <- function(input, output, session){
  
  observe({
    print(input$a)
  })
}

shinyApp(ui, server)
