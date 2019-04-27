#' Ouvrir la page d'aide
#' @export
dr_help <- function(){
  browseURL(
    system.file("docs", "index.html", package = "shinydreal")
  )
}
