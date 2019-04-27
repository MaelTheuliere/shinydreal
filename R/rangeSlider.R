#' Slider
#'
#' @inheritParams dr_sm_actionButton
#' @param min Minimum du slider.
#' @param max Maximum du slider.
#' @param value Valeur de départ du slider.
#'
#' @return Une tagList avec un sliderInput.
#' @export
#' @importFrom htmltools tags
#' @importFrom attempt stop_if
#'
#' @examples
#' if  (interactive()){
#'    library(shiny)
#'    ui <- function(request){
#'      dr_fluidPage(
#'        h2("plop"),
#'        tagList(
#'          dr_sliderInput("a", 1, 10, 5)
#'        )
#'      )
#'    }
#'    server <- function(input, output, session){
#'      observe({ print(input$a) })
#'    }
#'    shinyApp(ui, server)
#' }
dr_sliderInput <- function(
  inputId, 
  min, 
  max, 
  value
){
  stop_if(value, ~ .x < min, "value ne peux pas être inférieur à min")
  stop_if(value, ~ .x > max, "value ne peux pas être supérieur à max")
  stop_if(min > max, msg = "min ne peut pas être supérieur à max")
  tags$div(
    class = "slidecontainercontainer",
    tags$div(
      class = "slidecontainer", 
      tags$input(
        id = inputId, 
        type="range",
        class="slideranger",
        min = min, 
        max = max, 
        value = 7
      ), 
      tags$span(
        class="range min", 
        min
      ), 
      tags$span(
        class="range max", 
        max
      )
    )
  )

}