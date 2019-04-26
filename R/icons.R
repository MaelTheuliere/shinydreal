#' Icones
#'
#' @param name Nom de l'icone.
#' @param size Taille de l'icone.
#' @param color Couleur de l'icone.
#'
#' @return Un objet Shiny avec une îcone.
#' @export
#' @importFrom htmltools tags
#'
#' @examples
#' if  (interactive()){
#'    library(shiny)
#'    ui <- function(request){
#'      dr_fluidPage(
#'        h2("plop"),
#'        tagList(
#'          dr_icon("la-jsfiddle"),
#'          dr_icon("drl-explosion", size = 2),
#'          dr_icon("drl-cadastre", size = 7, color = 'red')
#'        )
#'      )
#'    }
#'    server <- function(input, output, session){
#'    }
#'    shinyApp(ui, server)
#' }
dr_icon <- function(
  name = shinydreal::dr_icon_list, 
  size = 1, 
  color = "#5a1e82"
){
  name <- match.arg(name)
  if (grepl("drl-", name)){
    tags$div(
      class = sprintf("icon %s", name), 
      style = sprintf("font-size:%srem;color:%s;", size, color)
    )
  } else {
    tags$div(
      tags$i(
        class = sprintf("la %s", name), 
        style = sprintf("font-size:%srem;color:%s;", size, color)
      )
    )
  }
  
}

