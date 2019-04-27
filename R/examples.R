#' Examples d'apps construites avec le template
#'
#' @param which Template à afficher.
#' @export
dr_examples <- function(
  which = NULL
){
  if (is.null(which)){
    return(
      list.files(
        system.file("examples", package = "shinydreal")
      )
    )
  } 
  shiny::runApp(
    system.file("examples", which, package = "shinydreal")
  )
}
