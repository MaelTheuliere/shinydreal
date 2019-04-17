pkgload::load_all()
library(shiny)
rm(list = ls())

dr_radioButtons <- function(
  inputId, 
  label, 
  choices = NULL, 
  selected = NULL
){
  tags$div(
    id = inputId, 
    tags$label(
      class="control-label", 
      `for` = inputId
    ), 
    lapply(
      choices, 
      function(x){
        tagList(
          tags$div(
            class="mb-2", 
            tags$label(
              class = "custom-control custom-radio", 
              tags$input(
                name = "radio", 
                class = "custom-control-input", 
                if (!is.null(selected) && x == selected){
                  "checked"
                } else {
                  ""
                }
              ), 
              tags$span(class = "custom-control-indicator"), 
              tags$span(class="custom-control-description", x)
            )
          )
        )
      })
  )
}

ui <- function(request){
  dr_fluidPage(
    h2("plop"),
    tagList(
      dr_selectInput(
        "plop", "plop", letters
      )
    )
  )
}

server <- function(input, output, session){
  observeEvent(input$show, {
    #browser()
    
    observe({
      print(input$plop)
    })
  })
}

shinyApp(ui, server)

