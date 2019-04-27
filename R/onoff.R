#' Boutons on off
#' 
#' Boutons on off rectables ou ronds. Côté serveur, renvoie 0 is ON, 1 si OFF.
#'
#' @inheritParams dr_sm_actionButton
#'
#' @return Un objet Shiny. 
#' @export
#' @rdname onoff
#' @importFrom htmltools tags
#'
#' @examples
#' if  (interactive()){
#'    library(shiny)
#'    ui <- function(request){
#'      dr_fluidPage(
#'        h2("plop"),
#'        tagList(
#'          dr_onOff("a")
#'        )
#'      )
#'    }
#'    server <- function(input, output, session){
#'      observe({ print(input$a) })
#'    }
#'    shinyApp(ui, server)
#' }
dr_onOff <- function(
  inputId
){
  tags$div(
    class = "switch-toggle switch-toggle-lg",
    tags$label(
      `for` = "switch-toggle-lg",
      class="switch-toggle-body", 
      tags$input(
        type="checkbox", 
        id="switch-toggle-lg", 
        class="switch-toggle-input"
      ), 
      tags$div(
        id = inputId,
        `data-value` = 0,
        class="switch-toggle-switch"
      )
    ) 
  )
}

#' @export
#' @rdname onoff
#' @importFrom htmltools tags
dr_sq_onOff <- function(
  inputId
){
  tags$div(
    class = "checkbox-toggle checkbox-toggle-lg",
    tags$input(
      type="checkbox", 
      id="checkbox-toggle-lg"
    ),
    tags$label(
      `for` = "checkbox-toggle-lg",
      tags$div(
        id = inputId,
        `data-value` = 0,
        class="checkbox-toggle-switch", 
        `data-checked`="On",
        `data-unchecked`="Off"
      )
    ) 
  )
}

