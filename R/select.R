#' Select Input
#'
#' @inheritParams dr_checkboxGroupInput
#' @export
#'
#' @examples
#' if  (interactive()){
#'    library(shiny)
#'    ui <- function(request){
#'      dr_fluidPage(
#'        h2("plop"),
#'        tagList(
#'          dr_selectInput("a", "Une selection", choices= letters[1:5])
#'        )
#'      )
#'    }
#'    server <- function(input, output, session){
#'      observe({ print(input$a) })
#'    }
#'    shinyApp(ui, server)
#' }
dr_selectInput <- function(
  inputId, 
  label, 
  choices, 
  selected = NULL
){
  choices <- c(choices[1], choices)
  if (is.null(selected)){
    selected <- choices[1]
  }
  tags$div(
    class = "control-select",
    id = inputId, 
    tags$label(label), 
    tags$select(
      mapply(function(choices, selected){
        tags$div(
          class = "control-select-inner",
          if (choices == selected){
            tags$option(
              value = choices, 
              class = "same-as-selected",
              choices
            )
          } else {
            tags$option(
              value = choices, 
              choices
            )
          }
        )
      }, choices, selected, SIMPLIFY = FALSE)
      
    )
  )

}