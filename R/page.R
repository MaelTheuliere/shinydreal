#' fluidPage avec les dépendances DREAL
#'
#' @param ... Contenu de la page
#'
#' @return Une fluidPage avec les dépendances DREAL.
#' @export
#'
dr_fluidPage <- function(...){
  page_skeleton(
    tags$div(
      class="container-fluid",
      tagList(
        ...
      )
    ) 
  )
}
