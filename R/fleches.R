#' Bouton de navigation
#' 
#' `dr_arrow_nav` se compose de deux boutons simples, `dr_square_nav` sont 
#' deux boutons rectangulaires avec du texte.
#'
#' @param id_left ID de la flêche de gauche, à récupérer côté serveur.
#' @param id_right  ID de la flêche de droite, à récupérer côté serveur.
#' @param text_left Pour `dr_square_nav`, texte de l'élément de gauche.
#' @param text_right Pour `dr_square_nav`, texte de l'élément de droite
#' @param value valeur de départ des flêches. 
#'
#' @return Un objet Shiny avec deux actionButtons.
#' @export
#' @rdname nav
#' @examples
#' if  (interactive()){
#'    library(shiny)
#'    ui <- function(request){
#'      dr_fluidPage(
#'        h2("plop"),
#'        tagList(
#'          dr_arrow_nav("gauche", "droite")
#'        )
#'      )
#'    }
#'    server <- function(input, output, session){
#'      observe({ print(input$gauche) })
#'      observe({ print(input$droite) })
#'    }
#'    shinyApp(ui, server)
#' }
dr_arrow_nav <- function(
  id_left, 
  id_right, 
  value = 0
) {
  tags$div(
    class="circle-nav",
    tags$a(
      class="nav-item",
      tags$i(id = id_left,
             class = "fleche icon la la-angle-left",
             #type = "button",
             `data-value` = as.character(value)
      )
    ), 
    tags$a(
      class="nav-item",
      tags$i(id = id_right,
             class = "fleche icon la la-angle-right",
             #type = "button",
             `data-value` = as.character(value)
      )
    )
    
  )
  
}

#' @export
#' @rdname nav
dr_square_nav <- function(
  id_left, 
  id_right,
  text_left = "Précédent", 
  text_right = "Suivant",
  value = 0
) {
  
  tags$div(
    tags$button(
      id = id_left,
      class="navigationbutton btn btn-secondary btn-icon btn-icon-left",
      `data-value` = as.character(value),
      tags$span(
        id = id_left,
        class = "navigation text",
        text_left,
        `data-value` = as.character(value), 
        onclick = "$(this.parentNode).click()"
      )
    ),
    tags$button(
      id = id_right,
      class="navigationbutton btn btn-secondary btn-icon btn-icon-right",
      `data-value` = as.character(value),
      tags$span(
        id = id_right,
        class = "navigation text",
        text_right,
        `data-value` = as.character(value), 
        onclick = "$(this.parentNode).click()"
      )
    )
  )
}

