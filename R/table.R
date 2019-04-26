#' tableOutput DREAL
#'
#' @param outputId ID de l'output
#' @param style "striped" ou "bordered"
#'
#' @return Un output pour server
#' @export
#' @importFrom shiny tableOutput
#'
#' @examples
#' if  (interactive()){
#'    library(shiny)
#'    ui <- function(request){
#'      dr_fluidPage(
#'        h2("plop"),
#'        tagList(
#'          dr_tableOutput("a", "striped"),
#'          dr_tableOutput("b", "bordered")
#'        )
#'      )
#'    }
#'    server <- function(input, output, session){
#'      output$a <- renderTable({
#'          iris
#'      })
#'      output$b <- renderTable({
#'          mtcars
#'      })
#'    }
#'    shinyApp(ui, server)
#' }
dr_tableOutput <- function(
  outputId, 
  style = c("striped", "bordered")
){
  style <- match.arg(style)
  x <- tableOutput(outputId)
  x$attribs$class <- paste(x$attribs$class, sprintf("table-%s", style))
  x
}