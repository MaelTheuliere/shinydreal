#' Date Range
#'
#' @param inputId ID à récupérer côté serveur.
#' @param label Titre du dateRange.
#' @param start Date de début.
#' @param end Date de fin.
#' @param min Date minimum.
#' @param max Date maximum.
#' @param format Format de la date. 
#' @param startview Zoom de départ du calendrier.
#' @param weekstart Numéro du jour où commence la semaine. 
#' @param language Langue
#' @param separator Séparateur du dateRange. 
#' @param width Taille. 
#' @param autoclose Fermeture automatique ou non du dateRange.
#'
#' @return Un objet Shiny contenant un dateRange.
#' @export
#' @importFrom shiny dateRangeInput
#' 
#' @seealso 
#' Voir également `\link[shiny]{dateRangeInput}`.
#'
#' @examples
#' if  (interactive()){
#'    library(shiny)
#'    ui <- function(request){
#'      dr_fluidPage(
#'        h2("plop"),
#'        tagList(
#'          dr_dateRangeInput("a", "Choisir une date")
#'        )
#'      )
#'    }
#'    server <- function(input, output, session){
#'      observe({ print(input$a) })
#'    }
#'    shinyApp(ui, server)
#' }
dr_dateRangeInput <- function(
  inputId, 
  label, 
  start = NULL, 
  end = NULL, 
  min = NULL, 
  max = NULL, 
  format = "yyyy-mm-dd", 
  startview = "month", 
  weekstart = 0, 
  language = "fr", 
  separator = " et ", 
  width = NULL, 
  autoclose = TRUE
){
  tags$div(
    class = "dr_dateRange", 
    dateRangeInput(
      inputId = inputId, 
      label = label, 
      start = start, 
      end = end, 
      min = min, 
      max = max, 
      format = format, 
      startview = startview, 
      weekstart = weekstart, 
      language = language, 
      separator = separator, 
      width = width, 
      autoclose = autoclose
    )
  )
}