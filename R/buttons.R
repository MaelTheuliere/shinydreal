#' actionButton
#'
#' Boutons d'action, comportement similaire à `\link[shiny]{actionButton}`.
#'
#' @param inputId ID à récupérer côté serveur.
#' @param label Texte du bouton.
#' @param icon Icon du bouton. 
#' @param width Taille du bouton. 
#' @param ... Attributs à passer au bouton. 
#' @param type Type du bouton, pour passer des couleurs peut être l'un des suivants : `c("primary", "secondary", "info")`. 
#' 
#' @seealso 
#' Voir également `\link[shiny]{actionButton}`.
#'
#' @return Un objet Shiny contenant un actionButton.
#' @export
#' @rdname button
#' @importFrom shiny actionButton
#' @importFrom glue glue
#' @examples
#' if  (interactive()){
#'    library(shiny)
#'    ui <- function(request){
#'      dr_fluidPage(
#'        h2("plop"),
#'        tagList(
#'          dr_sm_actionButton("a", "Un bouton")
#'        )
#'      )
#'    }
#'    server <- function(input, output, session){
#'      observe({ print(input$a) })
#'    }
#'    shinyApp(ui, server)
#' }
dr_sm_actionButton <- function(
  inputId,
  label,
  icon = NULL,
  width = NULL,
  ...,
  type = c("primary", "secondary", "info")
){
  type <- match.arg(type)
  wrap_btn(
    actionButton(
      inputId = inputId,
      label = label,
      icon = icon,
      width = width,
      ...
    ),
    sprintf("btn-%s btn-sm", type)
  )
}

#' @export
#' @rdname button
#' @importFrom shiny actionButton
#' @importFrom glue glue
dr_actionButton <- function(
  inputId,
  label,
  icon = NULL,
  width = NULL,
  ...,
  type = c("primary", "secondary", "info")
){
  type <- match.arg(type)
  wrap_btn(
    actionButton(
      inputId = inputId,
      label = label,
      icon = icon,
      width = width,
      ...
    ),
    glue("btn-{type}")
  )
}

#' @export
#' @rdname button
#' @importFrom shiny actionButton
#' @importFrom glue glue
dr_lg_actionButton <- function(
  inputId,
  label,
  icon = NULL,
  width = NULL,
  ...,
  type = c("primary", "secondary", "info")
){
  type <- match.arg(type)
  wrap_btn(
    actionButton(
      inputId = inputId,
      label = label,
      icon = icon,
      width = width,
      ...
    ),
    glue("btn-{type} btn-lg")
  )
}

wrap_btn <- function(btn, class){
  btn$attribs$class <- paste(btn$attribs$class, class)
  btn
}



