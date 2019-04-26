#' Boutons radio
#' 
#' Boutons radio permettant une selection unique.
#'
#' @inheritParams dr_checkboxGroupInput
#'
#' @return Une liste d'éléments Shiny avec des boutons radio.
#' @export
#'
#' @examples
#' if  (interactive()){
#'    library(shiny)
#'    ui <- function(request){
#'      dr_fluidPage(
#'        h2("plop"),
#'        tagList(
#'          dr_radioButton("a", "Une checkbox", choices = letters[1:4]) ,
#'          dr_radioButton("b", "Un Autre", choices = letters[1:4], type = "secondary")
#'        )
#'      )
#'    }
#'    server <- function(input, output, session){
#'      observe({ print(input$a) })
#'      observe({ print(input$b) })
#'    }
#'    shinyApp(ui, server)
#'}
dr_radioButton <- function(
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
    label_class <- sprintf("%s custom-solid-radio", label_class)
  }
  tagList(
    tags$label(label),
    tags$div(
      id = inputId,
      class = "custom-control-parent-radio",
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
              HTML('<input name="radio" type="radio" class="custom-control-input" checked>')
            } else {
              tags$input(
                name="radio", 
                type="radio",
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