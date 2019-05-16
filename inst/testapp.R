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
  dr_sidebarPage(
    "plop",
    sidebar = dr_sidebarItems(
      dr_sidebarItem("un", "un"),
      dr_sidebarItem("deux", "deux"),
      dr_sidebarItem("trois", "trois")
    ), 
    dr_panel(
      id = "un",
      dr_icon("la-wheelchair", size = 12)
    ),
    dr_panel(
      id = "deux",
      dr_icon("la-wordpress", size = 12)
    ),
    dr_panel(
      id = "trois",
      dr_icon("la-youtube", size = 12)
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

