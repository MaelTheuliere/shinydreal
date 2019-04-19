pkgload::load_all()
library(shiny)
rm(list = ls())

incrementButton <- function(inputId, label, choices) {
  
  tags$div(
    class="btn-group bg-primary",
    
    tags$button(
      class = "increment btn btn-primary dropdown-toggle",
      type = "button",
      `data-toggle` = "dropdown",
      `aria-haspopup` = "true", 
      `aria-expanded` = "false", 
      label
      ), 
    tags$div(
      class="dropdown-menu", 
      lapply(choices, function(x){
        tags$button(
          id = sprintf("%s_%s", inputId, x),
          class = "dropdown-item", 
          `data-value` = 0,
          x
        )
      })
    )
  )
    
}
ui <- function(request){
  dr_fluidPage(
    h2("plop"),
    tagList(
      incrementButton("plop", "plop", letters[1:3])
    #   HTML('<div >
    #             <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Primary</button>
    #             <div class="dropdown-menu">
    #                 <a class="dropdown-item" href="#">Action</a>
    #                 <a class="dropdown-item" href="#">Another action</a>
    #                 <a class="dropdown-item" href="#">Something else here</a>
    #                 <div class="dropdown-divider"></div>
    #                 <a class="dropdown-item" href="#">Separated link</a>
    #             </div>
    #         </div>')
  )
  )
}

server <- function(input, output, session){
    
    observe({
      print(input$plop_a)
    })
    observe({
      print(input$plop_b)
    })
    observe({
      print(input$plop_c)
    })
}

shinyApp(ui, server)

