#' Barre de progression
#'
#' @inheritParams dr_sm_actionButton
#' @param type "primary" ou "secondary"
#' @param value Taille de la barre (entre 0 et 100)
#'
#' @return Une barre de progression.
#' @export
#' @importFrom attempt stop_if
#' @importFrom htmltools tags
#'
#' @examples
#' if  (interactive()){
#'    library(shiny)
#'    ui <- function(request){
#'      dr_fluidPage(
#'        h2("plop"),
#'        tagList(
#'          dr_progress("a", value = 25), 
#'          dr_actionButton("go", "go")
#'        )
#'      )
#'    }
#'    server <- function(input, output, session){
#'      observeEvent(input$go, {
#'          update_dr_progress(session, "a", sample(1:100, 1)) 
#'      })
#'    }
#'    shinyApp(ui, server)
#' }
dr_progress <- function(
  inputId,
  type = c("primary", "secondary"),
  value = 25
){
  type <- match.arg(type)
  stop_if(value, ~ .x < 0, "value ne doit pas être en dessous de 0")
  stop_if(value, ~ .x > 100, "value ne doit pas être en supérieur à 100")
  tags$div(
    class = "progress mb-3",
    tags$div(
      id = inputId,
      class= glue::glue("progressBar progress-bar bg-{type}"),
      role="progressbar",
      style = glue::glue("width: {value}%"),
      `aria-valuenow`= as.character(value),
      `aria-valuemin`= as.character(0),
      `aria-valuemax`= as.character(100)
    )
  )
}


#' Update de la barre de progression depuis le serveur
#'
#' @param session Objet `session` de `Shiny`
#' @param inputId ID de la barre
#' @param value Nouvelle valeur de la barre.
#' 
#' @export
update_dr_progress <- function(
  session, 
  inputId,
  value
) {
  session$sendInputMessage(inputId, message = list(value = value))
}

