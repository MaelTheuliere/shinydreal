#' Checkbox
#'
#' @param inputId id, récupéré côté serveur.
#' @param label Titre de la checkbox.
#' @param choices Choix possibles
#' @param selected Choix sélectionné au départ (part défaut, le premier est pris).
#' @param choiceNames Nom des choix, seront récupérés par le serveur. Par défaut, le nom des choix est repris.
#' @param type "primary" ou "secondary", couleur de la checkbox.
#' 
#' @seealso 
#' Voir également `\link[shiny]{checkboxGroupInput}`.
#' 
#' @return Un objet Shiny contenant une checkbox.
#' @export
#' @importFrom htmltools tagList tags HTML
#'
#' @examples
#' if  (interactive()){
#'    library(shiny)
#'    ui <- function(request){
#'      dr_fluidPage(
#'        h2("plop"),
#'        tagList(
#'          dr_checkboxGroupInput("a", "Une checkbox", choices = letters[1:4]) ,
#'          dr_checkboxGroupInput("b", "Un Autre", choices = letters[1:4], type = "secondary")
#'        )
#'      )
#'    }
#'    server <- function(input, output, session){
#'      observe({ print(input$a) })
#'      observe({ print(input$b) })
#'    }
#'    shinyApp(ui, server)
#' }
dr_checkboxGroupInput <- function(
  inputId, 
  label = NULL, 
  choices, 
  selected = NULL,
  choiceNames = NULL, 
  type = c("primary", "secondary")
) {
  type <- match.arg(type)
  if (is.null(choiceNames)){
    choiceNames <- choices
  }
  if (is.null(selected)){
    selected <- NA
  }
  label_class <- "custom-control custom-checkbox"
  if (type == "primary"){
    label_class <- sprintf("%s custom-solid-checkbox", label_class)
  }
  tagList(
    tags$label(label),
    tags$div(
      id = inputId,
      class = "custom-control-parent-checkbox",
      mapply(function(choices, choiceNames, selected){
        tags$div(
          class = "custom-control-child mb-2",
          tags$label(
            `data-name` = choiceNames,
            class = ifelse(
              choiceNames %in% selected,
              sprintf("%s checked", label_class),
              label_class
            ),
            if (choiceNames %in% selected){
              HTML('<input type="checkbox" class="custom-control-input" checked>')
            } else {
              tags$input(
                type = "checkbox",
                class = "custom-control-input"
              )
            },
            tags$span(
              class = "custom-control-indicator"
            ),
            tags$span(
              class = "custom-control-description",
              choices
            )
          )
        )
      }, choices, choiceNames, selected, SIMPLIFY = FALSE)
    )
  )
}